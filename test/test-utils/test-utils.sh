#!/bin/bash
USERNAME=${1:-vscode}

if [ -z $HOME ]; then
    HOME="/root"
fi

FAILED=()

echoStderr()
{
    echo "$@" 1>&2
}

check() {
    LABEL=$1
    shift
    echo -e "\n🧪 Testing $LABEL"
    if "$@"; then 
        echo "✅  Passed!"
        return 0
    else
        echoStderr "❌ $LABEL check failed."
        FAILED+=("$LABEL")
        return 1
    fi
}

checkMultiple() {
    PASSED=0
    LABEL="$1"
    echo -e "\n🧪 Testing $LABEL."
    shift; MINIMUMPASSED=$1
    shift; EXPRESSION="$1"
    while [ "$EXPRESSION" != "" ]; do
        if $EXPRESSION; then ((PASSED++)); fi
        shift; EXPRESSION=$1
    done
    if [ $PASSED -ge $MINIMUMPASSED ]; then
        echo "✅ Passed!"
        return 0
    else
        echoStderr "❌ $LABEL check failed."
        FAILED+=("$LABEL")
        return 1
    fi
}

checkOSPackages() {
    LABEL=$1
    shift
    echo -e "\n🧪 Testing $LABEL"
    if dpkg-query --show -f='${Package}: ${Version}\n' "$@"; then 
        echo "✅  Passed!"
        return 0
    else
        echoStderr "❌ $LABEL check failed."
        FAILED+=("$LABEL")
        return 1
    fi
}

# check containers that expect root user as the default
checkCommonRoot()
{
    check "root user" bash -c '[ "$(id -u)" -eq 0 ]'
}

# check containers that expect/allow non-root user as the default
checkCommonNonRoot()
{
    check "non-root user" bash -c '[ "$(id -u)" -ne 0 ]'
    check "sudo" sudo echo "sudo works."
}

# checks python containers
checkCommonPython()
{
    # python related tests
    check "python" python --version
}

# tests containers with common-tools feature
checkCommonPythonTools()
{
    check "pipx" pipx --version
    check "poetry" poetry --version
    check "monkeytype" monkeytype -h
    check "mypy" mypy --version
    check "bandit" bandit --version
}

# checks basic gpu availability inside the container
checkCommonBasicGPU()
{
    check "nvidia-smi" nvidia-smi
}

# checks extensions installed
checkCommonExtensions()
{
    checkExtension "ms-python.python"
    checkExtension "ms-python.debugpy"
    checkExtension "ms-python.vscode-pylance"
    checkExtension "ms-python.isort"
    checkExtension "ms-toolsai.jupyter"
    checkExtension "ms-toolsai.jupyter-keymap"
    checkExtension "ms-toolsai.vscode-jupyter-cell-tags"
    checkExtension "ms-toolsai.jupyter-renderers"
    checkExtension "ms-toolsai.vscode-jupyter-slideshow"
    checkExtension "ms-toolsai.tensorboard"
    checkExtension "charliermarsh.ruff"
}

# checks cuda toolkit and cudnn, and other more specific tools
checkCompleteCuda()
{
    # cuda toolkit
    check "nvcc" nvcc --version
    check "cudnn" bash -c '[ -n "$(whereis cudnn.h | grep -o /)" ]'
}

# checks common os dependencies
checkCommon()
{
    PACKAGE_LIST="apt-utils \
        git \
        openssh-client \
        less \
        iproute2 \
        procps \
        curl \
        wget \
        unzip \
        nano \
        jq \
        lsb-release \
        ca-certificates \
        apt-transport-https \
        dialog \
        gnupg2 \
        libc6 \
        libgcc1 \
        libgssapi-krb5-2 \
        liblttng-ust[0-1] \
        libstdc++6 \
        zlib1g \
        locales \
        sudo"

    # checkOSPackages "common-os-packages" ${PACKAGE_LIST}

    # TODO: implement this for utility: https://code.visualstudio.com/docs/remote/vscode-server#_getting-started
    #checkMultiple "vscode-server" 1 "[ -d $HOME/.vscode-server/bin ]" "[ -d $HOME/.vscode-server-insiders/bin ]" "[ -d $HOME/.vscode-test-server/bin ]" "[ -d $HOME/.vscode-remote/bin ]" "[ -d $HOME/.vscode-remote/bin ]"
    check "locale" [ $(locale -a | grep en_US.utf8) ]
    check "git" git --version
    check "git-location" sh -c "which git | grep /usr/bin/git"
    check "login-shell-path" [ -f "/etc/profile.d/00-restore-env.sh" ]
    check "code" which code

    # dotfiles dependencies
    check "zsh" zsh --version
    # ensures sh points to dash
    check "sh-dash symlink" bash -c '[ "$(readlink -f "$(command -v sh)")" = "$(command -v dash)" ]'
    # checks if shell can install starship (is posix compliant)
    check "starship install" curl -sS https://starship.rs/install.sh | sh -s -- -y
}

reportResults() {
    if [ ${#FAILED[@]} -ne 0 ]; then
        echoStderr -e "\n💥  Failed tests: ${FAILED[@]}"
        exit 1
    else 
        echo -e "\n💯  All passed!"
        exit 0
    fi
}

# Useful for scenarios where UID/GID is not automatically updated - happens in GitHub Actions w/Docker Compose
fixTestProjectFolderPrivs() {
    if [ "${USERNAME}" != "root" ]; then
        TEST_PROJECT_FOLDER="${1:-$SCRIPT_FOLDER}"
        FOLDER_USER="$(stat -c '%U' "${TEST_PROJECT_FOLDER}")"
        if [ "${FOLDER_USER}" != "${USERNAME}" ]; then
            echoStderr "WARNING: Test project folder is owned by ${FOLDER_USER}. Updating to ${USERNAME}."
            sudo chown -R ${USERNAME} "${TEST_PROJECT_FOLDER}"
        fi
    fi
}

checkExtension() {
    # Happens asynchronusly, so keep retrying 10 times with an increasing delay
    EXTN_ID="$1"
    TIMEOUT_SECONDS="${2:-10}"
    RETRY_COUNT=0
    echo -e -n "\n🧪 Looking for extension $1 for maximum of ${TIMEOUT_SECONDS}s"
    until [ "${RETRY_COUNT}" -eq "${TIMEOUT_SECONDS}" ] || \
        [ ! -e $HOME/.vscode-server/extensions/${EXTN_ID}* ] || \
        [ ! -e $HOME/.vscode-server-insiders/extensions/${EXTN_ID}* ] || \
        [ ! -e $HOME/.vscode-test-server/extensions/${EXTN_ID}* ] || \
        [ ! -e $HOME/.vscode-remote/extensions/${EXTN_ID}* ]
    do
        sleep 1s
        (( RETRY_COUNT++ ))
        echo -n "."
    done

    if [ ${RETRY_COUNT} -lt ${TIMEOUT_SECONDS} ]; then
        echo -e "\n✅ Passed!"
        return 0
    else
        echoStderr -e "\n❌ Extension $EXTN_ID not found."
        FAILED+=("$LABEL")
        return 1
    fi
}