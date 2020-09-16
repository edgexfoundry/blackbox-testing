#!/bin/bash

option="${1}"

if [ "$ENV_SUFFIX" = "-docker" ]; then
  BB_ROOT_DIR=$(cd $(dirname "$0"); cd ..; pwd)
  COMPOSE=$BB_ROOT_DIR/$(ls $BB_ROOT_DIR | awk '/docker-compose/ && !/test-tools/')

  case ${option} in
    -useradd)
    echo "Info: Add security account."
    OT=$(docker-compose -p edgex -f ${COMPOSE} run --rm \
      --entrypoint /edgex/security-proxy-setup edgex-proxy --init=false --useradd=testuser --group=admin | grep '^the access token for')
    ;;

    -userdel)
    echo "Info: Delete security account."
    docker-compose -p edgex -f ${COMPOSE} run --rm \
      --entrypoint /edgex/security-proxy-setup edgex-proxy --init=false --userdel=testuser
    ;;

    *)
    exit 0
    ;;
  esac
else
  case ${option} in
    -useradd)
    echo "Info: Add security account."
    OT=$(sudo edgexfoundry.security-proxy-setup-cmd --confdir=/var/snap/edgexfoundry/current/config/security-proxy-setup/res --init=false --useradd=testuser --group=admin | grep '^the access token for')
    ;;

    -userdel)
    echo "Info: Delete security account."
    sudo edgexfoundry.security-proxy-setup-cmd --confdir=/var/snap/edgexfoundry/current/config/security-proxy-setup/res --init=false --userdel=testuser
    ;;

    *)
    exit 0
    ;;
  esac
fi

TOKEN=$(echo ${OT} | sed 's/.*: \([^.]*\.[^.]*\.[^.]*\).*/\1/')
export Token=${TOKEN}
echo ${TOKEN}
