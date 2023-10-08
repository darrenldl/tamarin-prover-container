#!/bin/bash

TAMARIN_VER="1.8.0"

if [[ "$PROJECT_DIR" == "" ]]; then
  echo "Please specify project directory"
  exit 1
fi

WORK_DIR_NAME=$(basename $PWD)

podman run -it \
  -v "$PWD":/home/user/"$WORK_DIR_NAME" \
  --userns keep-id:uid=1000,gid=1000 \
  --workdir /home/user/"$WORK_DIR_NAME" \
  --rm \
  -p "127.0.0.1:3001:3001" \
  docker.io/darrenldl/tamarin-prover:"$TAMARIN_VER"
