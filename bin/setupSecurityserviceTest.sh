#!/bin/bash

COMPOSE=$(dirname "$0")/../$(ls $(dirname "$0")/../ | awk '/docker-compose/ && !/test-tools/')
OT=$(docker-compose -f ${COMPOSE} run --rm --entrypoint /edgex/security-proxy-setup edgex-proxy --init=false --useradd=jerry --group=admin | grep '^the access token for')
export TOKEN=$( echo $OT | sed 's/.*: \([^.]*\.[^.]*\.[^.]*\).*/\1/')

#echo TOKEN=$TOKEN

RT=$(docker exec -i edgex-vault-worker sh -c "cat /tmp/edgex/secrets/edgex-security-proxy-setup/secrets-token.json")
export VAULTKEY=$(echo $RT | sed 's/.*"client_token":"\([^"]*\)".*/\1/')

#echo VAULTKEY=$VAULTKEY

echo "Info:Securityservice Setup Completed."

