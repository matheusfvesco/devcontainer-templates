#!/bin/bash
cd $(dirname "$0")

source test-utils.sh vscode

checkCommon
check "sudo" sudo echo "sudo works."
check "git" git --version
check "git-location" sh -c "which git | grep /usr/local/bin/git"
check "zsh" zsh --version

# python related tests
check "python" python --version
check "pipx" pipx --version
check "poetry" poetry --version
check "monkeytype" monkeytype -h
check "mypy" mypy --version
check "bandit" bandit --version

# gpu access related tests
check "nvidia-smi" nvidia-smi
check "nvcc" nvcc --version
check "cudnn" bash -c '[ -n "$(whereis cudnn.h | grep -o /)" ]'
check "pytorch cuda is available" python -c "import torch, sys; sys.exit(0) if torch.cuda.is_available() else sys.exit(1)"


# Report result
reportResults