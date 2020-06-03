#!/bin/bash

# x86_64 or arm64 for make run option
[ "$(uname -m)" != "x86_64" ] && USE_ARM64="arm64"

MAKEFILE=$(dirname "$0")/../Makefile

export TOKEN=`make -f ${MAKEFILE} get-token ${USE_ARM64} jerry`
echo TOKEN=$TOKEN

RT=$(docker exec -i edgex-vault-worker sh -c "cat /tmp/edgex/secrets/edgex-security-proxy-setup/secrets-token.json")
export VAULTKEY=$(echo $RT | sed 's/.*"client_token":"\([^"]*\)".*/\1/')

echo VAULTKEY=$VAULTKEY

echo "Info:Securityservice Setup Completed."

