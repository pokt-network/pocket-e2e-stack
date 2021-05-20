#!/usr/bin/env bash


GATEWAY_REPO_PATH=$GATEWAY_REPO_PATH docker-compose \
  -f stacks/pokt-net-prod.yml \
  -f stacks/bc-ipfs.yml \
  -f stacks/pokt-fdt-prod.yml \
  --project-directory ./ \
  down
