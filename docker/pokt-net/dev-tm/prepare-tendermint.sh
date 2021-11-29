#!/bin/sh

# this variable is set in the DOCKERFILE
cd $TENDERMINT_PATH
GOMODPROPER=$(grep pokt-network ./go.mod | awk '{print $1}')
if [ $GOMODPROPER == 'module' ];
then
  echo "go.mod is properly set for tendermint";
  echo "moving on...";
  GOMODSET=1;
else
  echo "go.mod not properly set for tendermint";
  GOMODSET=0;
fi

if [ $GOMODSET == 0 ];
then
  echo "Setting go.mod for tendermint...";
  cp $POCKET_PATH/go.mod.tendermint $TENDERMINT_PATH/go.mod
  echo "Done.";
fi



echo "Installing dependencies for tendermint..."
go mod download
echo "Updating dependencies for pocket-core"
cd $POCKET_PATH
cp go.mod.local go.mod
go mod download
echo "Done preparing tendermint, success!"
cd ../
