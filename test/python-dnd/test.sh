#!/bin/bash
cd $(dirname "$0")

source test-utils.sh vscode

checkCommon
checkCommonNonRoot

# python related tests
checkCommonPython
checkCommonPythonTools
check "python path" bash -c "[ -f /usr/local/bin/python ]"

# docker in docker
check "docker" which docker
check "docker alpine" docker pull --quiet alpine

# Report result
reportResults