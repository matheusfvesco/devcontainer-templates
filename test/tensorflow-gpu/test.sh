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
check "tensorflow GPU is available" python -c "import tensorflow as tf, sys; sys.exit(0) if len(tf.config.list_physical_devices('GPU')) > 0 else sys.exit(1)"

# Report result
reportResults