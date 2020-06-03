#!/bin/bash

NIGHT_BUILD_URL="https://raw.githubusercontent.com/lenny-intel/developer-scripts/multi2/releases/nightly-build/compose-files"

# so wget on windows can pull files
[ "$(uname -o)" = "Msys" ] && WINDOWS_WGET_OPTION="--no-check-certificate"

 # Download all the files, even if may not be used, so 'down' target works.
 wget -q ${WINDOWS_WGET_OPTION} -O Makefile \
    "${NIGHT_BUILD_URL}/Makefile"
 wget -q ${WINDOWS_WGET_OPTION} -O docker-compose-portainer.yml \
    "${NIGHT_BUILD_URL}/docker-compose-portainer.yml"
 wget -q ${WINDOWS_WGET_OPTION} -O docker-compose-nexus-base.yml \
    "${NIGHT_BUILD_URL}/docker-compose-nexus-base.yml"
 wget -q ${WINDOWS_WGET_OPTION} -O docker-compose-nexus-add-device-services.yml \
    "${NIGHT_BUILD_URL}/docker-compose-nexus-add-device-services.yml"
 wget -q ${WINDOWS_WGET_OPTION} -O docker-compose-nexus-add-security.yml \
    "${NIGHT_BUILD_URL}/docker-compose-nexus-add-security.yml"
 wget -q ${WINDOWS_WGET_OPTION} -O docker-compose-nexus-add-mqtt.yml \
    "${NIGHT_BUILD_URL}/docker-compose-nexus-add-mqtt.yml"
 wget -q ${WINDOWS_WGET_OPTION} -O docker-compose-nexus-ui.yml \
    "${NIGHT_BUILD_URL}/docker-compose-nexus-ui.yml"
