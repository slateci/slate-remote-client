#!/bin/bash

# Enable strict mode:
set -euo pipefail

# Change directories to mounted work:
cd /work

# Create the bash history file if necessary:
if [ ! -f "$HISTFILE" ]
then
  touch ./.bash_history_docker
fi

# Create the build directory if necessary:
if [ ! -d "./build" ]
then
  mkdir ./build
fi

cd ./build
cmake3 ..
make

${1:-/bin/bash}