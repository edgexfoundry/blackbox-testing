#!/bin/bash

# x86_64 or arm64
[ "$(uname -m)" != "x86_64" ] && USE_ARM64="-arm64"

# security or no security
[ "$SECURITY_SERVICE_NEEDED" != true ] && USE_NO_SECURITY="-no-secty"

# redis or mongo
if [ "${DATABASE:=redis}" = redis ]; then
     PERSIST="-redis"
else
     PERSIST="-mongo"
fi

# nightly or other release
USE_RELEASE=${RELEASE:-nightly-build}
if [ "$USE_RELEASE" = "nightly-build" ]; then
     COMPOSE_FILE="docker-compose-nexus${PERSIST}${USE_NO_SECURITY}${USE_ARM64}.yml"
     wget -q -O ${COMPOSE_FILE} "https://raw.githubusercontent.com/edgexfoundry/developer-scripts/master/releases/nightly-build/compose-files/${COMPOSE_FILE}"
elif [ "$USE_RELEASE" = "geneva" ]; then
     COMPOSE_FILE="docker-compose-geneva${PERSIST}${USE_NO_SECURITY}${USE_ARM64}.yml"
     wget -q -O ${COMPOSE_FILE} "https://raw.githubusercontent.com/edgexfoundry/developer-scripts/master/releases/geneva/${COMPOSE_FILE}"
fi



