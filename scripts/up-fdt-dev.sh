#!/usr/bin/env bash

POCKET_CORE_REPO_PATH=$POCKET_CORE_REPO_PATH \
GATEWAY_REPO_PATH=$GATEWAY_REPO_PATH docker-compose \
  -f stacks/pokt-net-dev.yml \
  -f stacks/bc-ipfs.yml \
  -f stacks/pokt-fdt-dev.yml \
  --project-directory ./ \
  up
