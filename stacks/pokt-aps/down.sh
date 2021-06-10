#!/usr/bin/env bash

if [ -z $CWD ];
then
  echo "Expected CWD env var, nothing was exported";
  exit 1;
fi

docker-compose \
  -f $CWD/stacks/pokt-aps/stack.yml \
  --project-directory $CWD/ \
  down
