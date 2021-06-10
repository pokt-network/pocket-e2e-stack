#!/usr/bin/env bash

if [ -z $CWD ];
then
  echo "Expected CWD env var, nothing was exported";
  exit 1;
fi

CWD=$CWD \
POCKETJS_REPO_PATH=$POCKETJS_REPO_PATH \
GATEWAY_REPO_PATH=$GATEWAY_REPO_PATH docker-compose \
  -f $CWD/stacks/pokt-net/dev/stack.yml \
  -f $CWD/stacks/pokt-blockchains/ipfs.yml \
  -f $CWD/stacks/pokt-fdt/dev/stack.yml \
  -f $CWD/stacks/pokt-aps/stack.yml \
  -f $CWD/stacks/pokt-all/dev/stack.yml \
  --project-directory $CWD/ \
  down \
  -v
