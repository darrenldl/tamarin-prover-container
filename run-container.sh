#!/bin/bash

TAMARIN_VER="1.6.1"

WORK_DIR_NAME=$(basename $PWD)

if [[ "$1" == "" ]]; then
  port="3001"
else
  port="$1"
fi

podman run -it \
  -v "$PWD":/home/user/"$WORK_DIR_NAME" \
  --userns keep-id:uid=1000,gid=1000 \
  --workdir /home/user/"$WORK_DIR_NAME" \
  --rm \
  -p "127.0.0.1:$port:3001" \
  docker.io/darrenldl/tamarin-prover:"$TAMARIN_VER"
