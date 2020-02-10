#!/bin/bash

option="${1}"

BB_ROOT_DIR=$(cd $(dirname "$0"); cd ..; pwd)

case ${option} in
  -useradd)
  echo "Info: Add security account."
  OT=$(docker-compose -f "${BB_ROOT_DIR}/"$(ls .. | awk '/docker-compose/ && !/test-tools/') run --rm \
    --entrypoint /edgex/security-proxy-setup edgex-proxy --init=false --useradd=geneva --group=admin | tail -1)
  export TOKEN=$(echo ${OT} | sed 's/.*: \([^ ]*\).*/\1/' | sed 's/\(.*\)./\1/')
  ;;
  -userdel)
  echo "Info: Delete security account."
  docker-compose -f "${BB_ROOT_DIR}/"$(ls .. | awk '/docker-compose/ && !/test-tools/') run --rm \
    --entrypoint /edgex/security-proxy-setup edgex-proxy --init=false --userdel=geneva
  ;;
  *)
  exit 0
  ;;
esac
