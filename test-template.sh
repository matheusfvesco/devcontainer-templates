#!/bin/bash

# Check if TEMPLATE-ID is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <TEMPLATE-ID>"
  exit 1
fi

TEMPLATE_ID=$1

# Run the build script
echo "Running build script for TEMPLATE-ID: ${TEMPLATE_ID}"
./.github/actions/smoke-test/build.sh "${TEMPLATE_ID}"

# Check if build script executed successfully
if [ $? -ne 0 ]; then
  echo "Build script failed for TEMPLATE-ID: ${TEMPLATE_ID}"
  # clears the temporary directory
  rm -rf "/tmp/${TEMPLATE_ID}"
  exit 1
fi

# Run the test script
echo "Running test script for TEMPLATE-ID: ${TEMPLATE_ID}"
./.github/actions/smoke-test/test.sh "${TEMPLATE_ID}"

# Check if test script executed successfully
if [ $? -ne 0 ]; then
  echo "Test script failed for TEMPLATE-ID: ${TEMPLATE_ID}"
  # clears temporary files, so actual changes be reflected on the next test
  rm -rf "/tmp/${TEMPLATE_ID}"
  # kills container
  ID_LABEL="test-container=${TEMPLATE_ID}"
  docker rm -f $(docker container ls -f "label=${ID_LABEL}" -q)
  exit 1
fi

echo "Both build and test scripts ran successfully for TEMPLATE-ID: ${TEMPLATE_ID}"
