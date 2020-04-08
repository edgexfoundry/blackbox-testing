#!/bin/bash

option="${1}"

BB_ROOT_DIR=$(cd $(dirname "$0"); cd ..; pwd)
COMPOSE=$BB_ROOT_DIR/$(ls $BB_ROOT_DIR | awk '/docker-compose/ && !/test-tools/')

case ${option} in
  -useradd)
  echo "Info: Add security account."
  OT=$(docker-compose -f ${COMPOSE} run --rm \
    --entrypoint /edgex/security-proxy-setup edgex-proxy --init=false --useradd=geneva --group=admin | grep '^the access token for')
  export TOKEN=$(echo ${OT} | sed 's/.*: \([^.]*\.[^.]*\.[^.]*\).*/\1/')
  ;;
  -userdel)
  echo "Info: Delete security account."
  docker-compose -f ${COMPOSE} run --rm \
    --entrypoint /edgex/security-proxy-setup edgex-proxy --init=false --userdel=geneva
  ;;
  *)
  exit 0
  ;;
esac
