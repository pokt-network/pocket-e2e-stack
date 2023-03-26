#!/bin/sh

if [[ -f "$POCKET_ROOT/go.mod.tendermint" ]]; then
  # Doing a `cp` here errors; concurrency issue
  mv $POCKET_ROOT/go.mod.tendermint $TENDERMINT_PATH/go.mod
  cd $TENDERMINT_PATH
  echo "Installing dependencies for tendermint..."
  # go mod vendor
  go mod download
fi

cd $TENDERMINT_PATH
go build cmd/tendermint/main.go

if [[ -f "$POCKET_ROOT/go.mod.core" ]]; then
  # Doing a `mv` here errors;  can't preserve ownershi
  cp $POCKET_ROOT/go.mod.core $POCKET_PATH/go.mod
  cd $POCKET_PATH
  echo "Installing dependencies for core..."
  # go mod vendor
  go mod download
fi

cd $POCKET_ROOT
