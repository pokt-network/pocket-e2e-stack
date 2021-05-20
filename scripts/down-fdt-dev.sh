#!/usr/bin/env bash


GATEWAY_REPO_PATH=$GATEWAY_REPO_PATH docker-compose \
  -f stacks/pokt-net.yml \
  -f stacks/bc-ipfs.yml \
  -f stacks/pokt-fdt-dev.yml \
  --project-directory ./ \
  down
