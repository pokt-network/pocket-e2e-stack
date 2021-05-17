#!/bin/sh

if [ -z $EXECOMMAND ]
then
  echo "Expecting EXECOMMAND env var, none was exported.";
  export EXECCOMMAND="start --keybase=false --datadir=/home/app/.pocket"
  echo "Exported $EXECCOMMAND as EXECCOMMAND";
fi;

if [ -z $POCKET_PATH ]
then
  echo "Expecting POCKET_PATH env var, none was exported";
  exit 1;
fi

reflex -r '\.go' -s -- sh -c 'go run $POCKET_PATH/app/cmd/pocket_core/main.go $EXECCOMMAND';
