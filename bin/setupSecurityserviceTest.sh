#!/bin/bash


if [ "$ENV_SUFFIX" = "-docker" ]; then
  COMPOSE=$(dirname "$0")/../$(ls $(dirname "$0")/../ | awk '/docker-compose/ && !/test-tools/')
  OT=$(docker-compose -p edgex -f ${COMPOSE} run --rm --entrypoint /edgex/security-proxy-setup edgex-proxy --init=false --useradd=jerry --group=admin | grep '^the access token for')
  RT=$(docker exec -i edgex-vault-worker sh -c "cat /tmp/edgex/secrets/edgex-security-proxy-setup/secrets-token.json")

else
  OT=$(sudo edgexfoundry.security-proxy-setup-cmd --confdir=/var/snap/edgexfoundry/current/config/security-proxy-setup/res --init=false --useradd=jerry --group=admin | grep '^the access token for')
  RT=$(sudo sh -c "cat /var/snap/edgexfoundry/current/secrets/edgex-security-proxy-setup/secrets-token.json")
fi

TOKEN=$(echo $OT | sed 's/.*: \([^.]*\.[^.]*\.[^.]*\).*/\1/')
export TOKEN
echo TOKEN=$TOKEN

VAULTKEY=$(echo $RT | sed 's/.*"client_token":"\([^"]*\)".*/\1/')
export VAULTKEY
echo VAULTKEY=$VAULTKEY

echo "Info:Securityservice Setup Completed."

