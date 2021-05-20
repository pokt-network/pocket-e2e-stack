#!/usr/bin/env bash

docker-compose \
  -f stacks/pokt-net-prod.yml \
  --project-directory ./ \
  down
