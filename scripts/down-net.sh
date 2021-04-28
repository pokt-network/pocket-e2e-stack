#!/usr/bin/env bash

docker-compose \
  -f stacks/pokt-net.yml \
  --project-directory ./ \
  down
