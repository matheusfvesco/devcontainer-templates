#!/bin/bash
cd $(dirname "$0")

source test-utils.sh vscode

checkCommon
check "python" python --version
check "pipx" pipx --version
check "nvidia-smi" nvidia-smi
check "nvcc" nvcc --version
check "cudnn" bash -c '[ -n "$(whereis cudnn.h | grep -o /)" ]'

# Report result
reportResults