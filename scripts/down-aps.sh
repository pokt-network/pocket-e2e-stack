#!/usr/bin/env bash

docker-compose \
  -f stacks/pokt-aps.yml \
  --project-directory ./ \
  down
