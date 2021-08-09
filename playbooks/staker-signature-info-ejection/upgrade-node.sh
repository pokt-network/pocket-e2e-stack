#!/usr/bin/env bash

if [ -z $NODE ];
then
  echo "NODE is required, but none was set."
  exit 1;
fi

if [ -z $UPGRADE_TARGET_VERSION ];
then
  echo "UPGRADE_TARGET_VERSION is required, but none was set."
  exit 1;
fi

STOP_NODE() {
  docker stop localnet_$NODE.pokt_1
  docker rm localnet_$NODE.pokt_1
}

START_NODE_WITH_VERSION() {
  POCKET_CORE_TARGET_VERSION=$UPGRADE_TARGET_VERSION SPECIFIC_NODE=$NODE bin/pkt-stack pokt-net prod up
}

ACTION=$1

case $ACTION in
  "stop")
    STOP_NODE;
    exit 0;
    ;;

  "start")
    echo "Spinning $ACTION $STACK $ENV stack..."
    START_NODE_WITH_VERSION;
    exit 0;
    ;;

  *)
    echo "Undetermined action";
    exit 1;
    ;;
esac

