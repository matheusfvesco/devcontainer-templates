#!/bin/bash
cd $(dirname "$0")

source test-utils.sh vscode

checkCommon
check "root user" bash -c '[ "$(id -u)" -eq 0 ]'
check "bash posix default" bash -c '[ "$POSIXLY_CORRECT" = "1" ]'
check "git" git --version
check "git-location" sh -c "which git | grep /usr/local/bin/git"
check "zsh" zsh --version

# python related tests
check "python" python --version

# gpu access related tests
check "nvidia-smi" nvidia-smi
check "nvcc" nvcc --version
check "cudnn" bash -c '[ -n "$(whereis cudnn.h | grep -o /)" ]'
check "pytorch cuda is available" python -c "import torch, sys; sys.exit(0) if torch.cuda.is_available() else sys.exit(1)"
check "tensorflow GPU is available" python -c "import tensorflow as tf, sys; sys.exit(0) if len(tf.config.list_physical_devices('GPU')) > 0 else sys.exit(1)"


# Report result
reportResults