#!/usr/bin/env bash

if [ -z $CWD ];
then
  echo "Expected CWD env var, nothing was exported";
  exit 1;
fi

GATEWAY_REPO_PATH=$GATEWAY_REPO_PATH docker-compose \
  -f ${CWD}/stacks/pokt-net/prod/stack.yml \
  -f ${CWD}/stacks/pokt-fdt/prod/stack.yml \
  --project-directory ${CWD}/ \
  up
