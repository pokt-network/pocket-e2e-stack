#!/usr/bin/env bash

if [ -z $CWD ];
then
  echo "Expected CWD env var, nothing was exported";
  exit 1;
fi

if [ -z $SPECIFIC_NODE ];
then
  docker-compose \
    -f $CWD/stacks/pokt-net/prod/stack.yml \
    --project-directory $CWD/ \
    up \
    --build
#    --build \
#    --force-recreate
else
  docker-compose \
    -f $CWD/stacks/pokt-net/prod/stack.yml \
    --project-directory $CWD/ \
    up \
    --build \
    $SPECIFIC_NODE
#    --force-recreate \
fi
