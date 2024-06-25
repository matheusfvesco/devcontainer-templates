#!/bin/bash
cd $(dirname "$0")

source test-utils.sh vscode

checkCommon
check "python" python --version
check "pipx" pipx --version
check "nvidia-smi" nvidia-smi
check "nvcc" nvcc --version
check "cudnn" bash -c '[ -n "$(whereis cudnn.h | grep -o /)" ]'
check "git" git --version
check "pytorch cuda is available" python -c "import torch, sys; sys.exit(0) if torch.cuda.is_available() else sys.exit(1)"

# Report result
reportResults