#!/bin/bash
cd $(dirname "$0")

source test-utils.sh vscode

checkCommon
checkCommonRoot

# python related tests
checkCommonPython

# gpu access related tests
checkCommonBasicGPU
checkCompleteCuda
check "pytorch cuda is available" python -c "import torch, sys; sys.exit(0) if torch.cuda.is_available() else sys.exit(1)"
check "tensorflow GPU is available" python -c "import tensorflow as tf, sys; sys.exit(0) if len(tf.config.list_physical_devices('GPU')) > 0 else sys.exit(1)"

# Report result
reportResults