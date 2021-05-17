#!/usr/bin/env bash

docker-compose \
  -f stacks/pokt-net.yml \
  --project-directory ./ \
  up \
  --force-recreate \
  fullnode.pokt.prod.dockerhub \
