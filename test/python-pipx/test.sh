#!/bin/bash
cd $(dirname "$0")

source test-utils.sh vscode

checkCommon
checkCommonPython
checkCommonPythonTools
checkCommonBasicGPU
checkCompleteCuda

# Report result
reportResults