#!/bin/bash
cd $(dirname "$0")

source test-utils.sh vscode

checkCommon
checkCommonPython
checkCommonPythonTools

# Report result
reportResults