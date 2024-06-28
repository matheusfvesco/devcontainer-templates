#!/bin/bash

failed_tests=()

for dir in src/*; do
  [[ -d "$dir" ]] && ./test-template.sh "${dir##*/}"
  if [ $? -ne 0 ]; then
    failed_tests+=("${dir##*/}")
  fi
  done

if [[ ${#failed_tests[@]} -gt 0 ]]; then
  echo "Tests failed in the following templates:"
  for test in "${failed_tests[@]}"; do
    echo "  - $test"
  done
else
  echo "All templates passed on the tests!"
fi

echo "Finished testing directories in src"