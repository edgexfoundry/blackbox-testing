#!/bin/bash

echo "Info: Clean Securityservice's test data."

if [ "$ENV_SUFFIX" = "-docker" ]; then
  COMPOSE=$(dirname "$0")/../$(ls $(dirname "$0")/../ | awk '/docker-compose/ && !/test-tools/')
  docker-compose -p edgex -f ${COMPOSE} run --rm --entrypoint /edgex/security-proxy-setup edgex-proxy --init=false --userdel=testuser
else
  sudo edgexfoundry.security-proxy-setup-cmd --confdir=/var/snap/edgexfoundry/current/config/security-proxy-setup/res --init=false --userdel=testuser
fi

echo "Info: Securityservice's test data Cleaned"
