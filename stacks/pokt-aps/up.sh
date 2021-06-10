#!/usr/bin/env bash

docker-compose \
  -f stacks/pokt-aps.yml \
  --project-directory ./ \
  up \
  --build \
  --force-recreate
