#!/usr/env/bin bash

if [ -z "$POCKET_CORE_REPO_PATH" ];
then
  echo "POCKET_CORE_REPO_PATH env var is required, none was exported";
  exit 1;
fi;

read -p "This command will try to copy the following scripts to $POCKET_CORE_REPO_PATH:

  - ./scripts/install-deps.sh
  - ./scripts/watch.sh
  - ./scripts/entrypoint-dev.sh
  - ./scripts/command.sh

  would you like to continue [Y/n]: " continueScript

if [ "$continueScript" = "n" ] || [ "$continueScript" = "N" ]
then
  echo "Not copying";
else
  echo "Copying...";
  cp $CWD/scripts/install-deps.sh $POCKET_CORE_REPO_PATH;
  if [ $? -eq 1 ]
  then
    echo "Failed to copy $CWD/install-deps.sh to $POCKET_CORE_REPO_PATH...";
  else
    echo "Successfully copied $CWD/install-deps.sh to $POCKET_CORE_REPO_PATH...";
  fi;

  cp $CWD/scripts/watch.sh $POCKET_CORE_REPO_PATH;
  if [ $? -eq 1 ]
  then
    echo "Failed to copy $CWD/watch.sh to $POCKET_CORE_REPO_PATH...";
  else
    echo "Successfully copied $CWD/watch.sh to $POCKET_CORE_REPO_PATH...";
  fi;

  cp $CWD/scripts/entrypoint-dev.sh $POCKET_CORE_REPO_PATH;
  if [ $? -eq 1 ]
  then
    echo "Failed to copy $CWD/entrypoint-dev.sh to $POCKET_CORE_REPO_PATH...";
  else
    echo "Successfully copied $CWD/entrypoint-dev.sh to $POCKET_CORE_REPO_PATH...";
  fi;

  cp $CWD/scripts/command.sh $POCKET_CORE_REPO_PATH;
  if [ $? -eq 1 ]
  then
    echo "Failed to copy $CWD/command.sh to $POCKET_CORE_REPO_PATH...";
  else
    echo "Successfully copied $CWD/command.sh to $POCKET_CORE_REPO_PATH...";
  fi;
fi;
