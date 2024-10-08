#!/bin/bash
cd $(dirname "$0")

source test-utils.sh vscode

checkCommon
checkCommonNonRoot

# python related tests
checkCommonPython
check "python path" bash -c "[ -f /opt/conda/bin/python  ]"

# checks extensions
checkCommonExtensions

# docker in docker
check "docker" which docker
check "docker alpine" docker pull --quiet alpine

# gpu access related tests
checkCommonBasicGPU

# Report result
reportResults