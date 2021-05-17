#!/usr/bin/env bash

CWD=$CWD \
POCKET_CORE_REPO_PATH=$POCKET_CORE_REPO_PATH \
POCKETJS_REPO_PATH=$POCKETJS_REPO_PATH \
GATEWAY_REPO_PATH=$GATEWAY_REPO_PATH docker-compose \
  -f stacks/pokt-net.yml \
  -f stacks/bc-ipfs.yml \
  -f stacks/pokt-fdt.yml \
  -f stacks/pokt-aps.yml \
  -f stacks/pokt-all-prod.yml \
  --project-directory ./ \
  up \
  --build \
  --force-recreate
