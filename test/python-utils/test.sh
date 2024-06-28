#!/bin/bash
cd $(dirname "$0")

source test-utils.sh vscode

checkCommon
checkCommonNonRoot

checkCommonPython
checkCommonPythonTools
check "python path" bash -c "[ -f /usr/local/bin/python ]"

# Report result
reportResults