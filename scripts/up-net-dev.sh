#!/usr/bin/env bash

/bin/bash $(pwd)/scripts/copy-pocket-core-scripts.sh

docker-compose \
  -f stacks/pokt-net.yml \
  --project-directory ./ \
  up \
  --build \
  --force-recreate \
  fullnode.pokt.dev.local
