#!/bin/sh

echo "Called prepare-tendermint.sh"

# WARNING: This is not needed every time, but we do this way to make
#          it work for v0 right now.
# Doing a `mv` here errors;  can't preserve ownership
cp -f $POCKET_ROOT/go.mod.tendermint $TENDERMINT_PATH/go.mod
cp -f $POCKET_ROOT/go.mod.core $POCKET_PATH/go.mod

# if [[ -f "$POCKET_ROOT/go.mod.tendermint" ]]; then
if [[ -f "/dev/tendermint.built" ]]; then
  touch "/dev/tendermint.built"
  echo "Installing dependencies for tendermint..."
  cd $TENDERMINT_PATH
  # Need to update vendor/module.txt to the local dev paths
  go mod tidy && go mod vendor
  # Need to get the dependencies in the docker container
  go mod download
  go build cmd/tendermint/main.go
fi

if [[ -f "/dev/core.built" ]]; then
  touch "/dev/core.built"
  echo "Installing dependencies for core..."
  cd $POCKET_PATH
  # Need to update vendor/module.txt to the local dev paths
  go mod tidy && go mod vendor
  # Need to get the dependencies in the docker container
  go mod download
fi

cd $POCKET_ROOT
