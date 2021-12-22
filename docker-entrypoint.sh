#!/bin/bash

# Enable strict mode:
set -euo pipefail

# Create the bash history file if necessary:
if [ ! -f "$HISTFILE" ]
then
  touch ./.bash_history_docker
fi

cd /work/build
cmake3 ..
make

${1:-/bin/bash}