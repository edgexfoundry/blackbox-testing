#!/bin/bash

MONGO_PERSIST="-mongo"
NIGHT_BUILD_URL="https://raw.githubusercontent.com/lenny-intel/developer-scripts/multi2/releases/nightly-build/compose-files"
GENEVA_URL="https://raw.githubusercontent.com/edgexfoundry/developer-scripts/master/releases/geneva"

# so wget on windows can pull files
[ "$(uname -o)" = "Msys" ] && WINDOWS_WGET_OPTION="--no-check-certificate"

# x86_64 or arm64
[ "$(uname -m)" != "x86_64" ] && USE_ARM64="-arm64"

# security or no security
[ "$SECURITY_SERVICE_NEEDED" != true ] && USE_NO_SECURITY="-no-secty"

# redis or mongo
if [ "${DATABASE:=redis}" = redis ]; then
     PERSIST="-redis"
else
     PERSIST=${MONGO_PERSIST}
fi

# nightly or other release
USE_RELEASE=${RELEASE:-nightly-build}
if [ "$USE_RELEASE" = "nightly-build" ]; then
  if [ "$PERSIST" = ${MONGO_PERSIST} ]; then
     echo "Mongo no longer supported. No compose file(s) downloaded"
     exit
  fi

   # Download all the files, even if may not be used, so 'down' target works.
   wget -q ${WINDOWS_WGET_OPTION} -O Makefile \
      "${NIGHT_BUILD_URL}/Makefile"
   wget -q ${WINDOWS_WGET_OPTION} -O docker-compose-portainer.yml \
      "${NIGHT_BUILD_URL}/docker-compose-portainer.yml"
   wget -q ${WINDOWS_WGET_OPTION} -O docker-compose-nexus-base.yml \
      "${NIGHT_BUILD_URL}/docker-compose-nexus-base.yml"
   wget -q ${WINDOWS_WGET_OPTION} -O docker-compose-nexus-add-security.yml \
      "${NIGHT_BUILD_URL}/docker-compose-nexus-add-security.yml"
   wget -q ${WINDOWS_WGET_OPTION} -O docker-compose-nexus-add-mqtt.yml \
      "${NIGHT_BUILD_URL}/docker-compose-nexus-add-mqtt.yml"
   wget -q ${WINDOWS_WGET_OPTION} -O docker-compose-nexus-ui.yml \
      "${NIGHT_BUILD_URL}/docker-compose-nexus-add-mqtt.yml"

elif [ "$USE_RELEASE" = "geneva" ]; then
     COMPOSE_FILE="docker-compose-geneva${PERSIST}${USE_NO_SECURITY}${USE_ARM64}.yml"
     wget -q -O ${COMPOSE_FILE} "${GENEVA_URL}/${COMPOSE_FILE}"
fi

