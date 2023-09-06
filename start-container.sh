#!/bin/bash

PROJECT_DIR="$1"
TAMARIN_VER="1.8.0"

if [[ "$PROJECT_DIR" == "" ]]; then
  echo "Please specify project directory"
  exit 1
fi

podman run -it \
  -v ~/"$PROJECT_DIR":/home/user/"$PROJECT_DIR" \
  --userns keep-id:uid=1000,gid=1000 \
  --workdir /home/user/"$PROJECT_DIR" \
  --rm \
  -p "127.0.0.1:3001:3001" \
  docker.io/darrenldl/tamarin-prover:"$TAMARIN_VER"
