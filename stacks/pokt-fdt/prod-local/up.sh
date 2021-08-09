#!/usr/bin/env bash

if [ -z $CWD ];
then
  echo "Expected CWD env var, nothing was exported";
  exit 1;
fi

EXPLORER_REPO_PATH=$EXPLORER_REPO_PATH \
WALLET_REPO_PATH=$WALLET_REPO_PATH \
POCKET_CORE_REPO_PATH=$POCKET_CORE_REPO_PATH \
GATEWAY_REPO_PATH=$GATEWAY_REPO_PATH docker-compose \
  -f $CWD/stacks/pokt-net/prod-local/stack.yml \
  -f $CWD/stacks/pokt-fdt/prod-local/stack.yml \
  --project-directory $CWD/ \
  up
