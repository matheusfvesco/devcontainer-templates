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
check "pytorch cuda is available" python -c "import torch, sys; sys.exit(0) if torch.cuda.is_available() else sys.exit(1)"

# Report result
reportResults