#!/bin/bash
cd $(dirname "$0")

source test-utils.sh vscode

checkCommon


# python related tests
checkCommonPython
checkCommonPythonTools

# gpu access related tests
checkCommonBasicGPU
checkCompleteCuda
check "pytorch cuda is available" python -c "import torch, sys; sys.exit(0) if torch.cuda.is_available() else sys.exit(1)"


# Report result
reportResults