#!/usr/bin/env bash

CWD=$CWD \
POCKETJS_REPO_PATH=$POCKETJS_REPO_PATH \
GATEWAY_REPO_PATH=$GATEWAY_REPO_PATH docker-compose \
  -f stacks/pokt-net-dev.yml \
  -f stacks/bc-ipfs.yml \
  -f stacks/pokt-fdt-dev.yml \
  -f stacks/pokt-aps.yml \
  -f stacks/pokt-all-dev.yml \
  --project-directory ./ \
  down \
  -v
