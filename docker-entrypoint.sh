#!/bin/bash

# Enable strict mode:
set -euo pipefail

# Create the bash history file if necessary:
if [ ! -f "$HISTFILE" ]
then
  touch ./.bash_history_docker
fi

# Build the slate executable:
cd ./build
cmake3 ..
make

${1:-/bin/bash}