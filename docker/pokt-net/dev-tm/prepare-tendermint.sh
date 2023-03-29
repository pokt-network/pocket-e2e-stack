#!/bin/sh

echo "Called prepare-tendermint.sh"

# if [[ -f "$POCKET_ROOT/go.mod.tendermint" ]]; then
if [[ -f "/dev/tendermint.built" ]]; then
  touch "/dev/tendermint.built"
  echo "Installing dependencies for tendermint..."
  # Doing a `cp` here errors; concurrency issue
  cp -f $POCKET_ROOT/go.mod.tendermint $TENDERMINT_PATH/go.mod
  cd $TENDERMINT_PATH
  # Need to update vendor/module.txt to the local dev paths
  go mod tidy && go mod vendor
  # Need to get the dependencies in the docker container
  go mod download
fi
cd $TENDERMINT_PATH
go build cmd/tendermint/main.go

if [[ -f "/dev/core.built" ]]; then
  touch "/dev/core.built"
  echo "Installing dependencies for core..."
  # Doing a `mv` here errors;  can't preserve ownershi
  cp -f $POCKET_ROOT/go.mod.core $POCKET_PATH/go.mod
  cd $POCKET_PATH
  # Need to update vendor/module.txt to the local dev paths
  go mod tidy && go mod vendor
  # Need to get the dependencies in the docker container
  go mod download
fi

cd $POCKET_ROOT
