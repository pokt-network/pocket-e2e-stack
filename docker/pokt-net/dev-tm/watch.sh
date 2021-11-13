#!/bin/sh

echo "POCKET_CORE_KEY: $POCKET_CORE_KEY, POCKET_CORE_SEEDS: $POCKET_CORE_SEEDS, POCKET_CORE_PUBLIC_KEY: $POCKET_CORE_PUBLIK_KEY";
if [ -z $EXECOMMAND ]
then
  echo "Expecting EXECOMMAND env var, none was exported.";
  export EXECCOMMAND="start --seeds $POCKET_CORE_SEEDS --keybase=false --datadir=/home/app/.pocket"
  echo "Exported $EXECCOMMAND as EXECCOMMAND";
fi;

if [ -z $POCKET_PATH ]
then
  echo "Expecting POCKET_PATH env var, none was exported";
  exit 1;
fi

command=""
if [ $DEBUG==1 ];
then
  command="$POCKET_PATH/../prepare-tendermint.sh && sleep 1 && cd $POCKET_PATH && touch output.dlv && dlv debug $POCKET_PATH/app/cmd/pocket_core/main.go --continue --output output.dlv --headless --accept-multiclient --listen=:$DEBUG_PORT --api-version=2 -- $EXECCOMMAND"
else
  command="$POCKET_PATH/../prepare-tendermint.sh && sleep 1 && cd $POCKET_PATH && go run $POCKET_PATH/app/cmd/pocket_core/main.go $EXECCOMMAND"
fi;

echo $command;
cd $POCKET_PATH/..
reflex \
  --start-service \
  -r '\.go' \
  -s -- sh -c $command;

