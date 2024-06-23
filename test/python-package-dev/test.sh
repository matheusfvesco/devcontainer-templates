#!/bin/bash
cd $(dirname "$0")

source test-utils.sh vscode

checkCommon
check "python" python --version
check "poetry" poetry --version
check "mypy" mypy --version
check "monkeytype" monkeytype -h

# Report result
reportResults