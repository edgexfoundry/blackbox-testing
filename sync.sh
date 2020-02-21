#!/bin/bash

# x86_64 or arm64
[ "$(uname -m)" != "x86_64" ] && USE_ARM64="-arm64"

# security or no security
[ "$SECURITY_SERVICE_NEEDED" != true ] && USE_NO_SECURITY="-no-secty"

# redis or mongo
if [ "${FOR_REDIS:=true}" = true ]; then 
     PERSIST="-redis"
else
     PERSIST="-mongo"
fi

# [Workaround] there is no docker-compose-nexus-redis.yml now
[ "$SECURITY_SERVICE_NEEDED" = true ] && PERSIST="-mongo"

# nightly or other release
USE_RELEASE=${RELEASE:-nightly-build}
if [ "$USE_RELEASE" = "nightly-build" ]; then
     COMPOSE_FILE="docker-compose-nexus${PERSIST}${USE_NO_SECURITY}${USE_ARM64}.yml"
else
     COMPOSE_FILE="docker-compose${PERSIST}-${USE_RELEASE}${USE_NO_SECURITY}${USE_ARM64}.yml"
fi

wget -q -O ${COMPOSE_FILE} "https://raw.githubusercontent.com/edgexfoundry/developer-scripts/master/releases/${USE_RELEASE}/compose-files/${COMPOSE_FILE}"

# Use Centos base image instead of Alpine base image for Kong for x86_64 CI
# due to compatibility issues with Alpine image in CI
# sed command of MacOS is in different syntax 
if [ "$(uname -m)" = "x86_64" ] && [ "$(uname)" = "Darwin" ]; then
     sed -i '' 's/kong:1.3.0$/kong:1.3.0-centos/' ${COMPOSE_FILE}
elif [ "$(uname -m)" = "x86_64" ]; then
     sed -i 's/kong:1.3.0$/kong:1.3.0-centos/' ${COMPOSE_FILE}
fi




