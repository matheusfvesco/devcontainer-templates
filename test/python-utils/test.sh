#!/bin/bash
cd $(dirname "$0")

source test-utils.sh vscode

checkCommon
checkCommonNonRoot

# python related tests
checkCommonPython
checkCommonPythonTools
check "python path" bash -c "[ -f /usr/local/bin/python ]"

# checks extensions
checkCommonExtensions

# Report result
reportResults