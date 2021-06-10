#!/usr/bin/env bash

CWD=$CWD \
GATEWAY_REPO_PATH=$GATEWAY_REPO_PATH docker-compose \
  -f stacks/pokt-net-dev.yml \
  -f stacks/bc-ipfs.yml \
  -f stacks/pokt-fdt-dev.yml \
  -f stacks/pokt-all-dev-no-aps.yml \
  --project-directory ./ \
  down \
  -v
