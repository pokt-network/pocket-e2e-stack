#!/usr/bin/bash

export POCKET_CORE_REPOS_PATH=$POCKET_CORE_REPOS_PATH
export POCKET_E2E_STACK_RELATIVE_PATH=$(basename -a $POCKET_E2E_STACK_PATH)

echo "Copying playground .env to proper path..."
cp $CWD/.playground.env $CWD/playground/.env

# TODO: Make both of these more configurable.
cp $CWD/stacks/pokt-net/shared/genesis.json $CWD/playground/templates/genesis.json
cp $CWD/stacks/pokt-net/shared/chains.local.json $CWD/playground/templates/chains.json

docker-compose \
  -f $CWD/stacks/pokt-net/scaffold/stack.yml \
  --project-directory $CWD/ \
  up \
  --build \
  --force-recreate

echo 'Done';
