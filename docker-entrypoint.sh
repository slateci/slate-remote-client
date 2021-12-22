#!/bin/bash

# Enable strict mode:
set -euo pipefail

# Create the bash history file if necessary:
if [ ! -f "$HISTFILE" ]
then
  touch ./.bash_history_docker
fi

# Building:
echo "Building the slate executable..."
cd ./build
cmake3 ..
make

# Testing:
echo "Testing the slate executable..."
echo Endpoint: $(echo "$SLATE_API_ENDPOINT")
echo "$(./slate whoami 2>&1 | head -n 2)"

${1:-/bin/bash}
