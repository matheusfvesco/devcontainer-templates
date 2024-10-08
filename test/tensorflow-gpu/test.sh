#!/bin/bash
cd $(dirname "$0")

source test-utils.sh vscode

checkCommon
checkCommonNonRoot

# python related tests
checkCommonPython
checkCommonPythonTools
check "python path" bash -c "[ -f /usr/bin/python ]"

# checks extensions
checkCommonExtensions

# gpu access related tests
checkCommonBasicGPU
checkCompleteCuda
check "tensorflow GPU is available" python -c "import tensorflow as tf, sys; sys.exit(0) if len(tf.config.list_physical_devices('GPU')) > 0 else sys.exit(1)"

# Report result
reportResults