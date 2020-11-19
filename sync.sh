#!/bin/bash

HANOI_RELEASE_URL="https://raw.githubusercontent.com/edgexfoundry/developer-scripts/master/releases/hanoi/compose-files"

# x86_64 or arm64
[ "$(uname -m)" != "x86_64" ] && USE_ARM64="-arm64"

# security or no security
[ "$SECURITY_SERVICE_NEEDED" != true ] && USE_NO_SECURITY="-no-secty"

COMPOSE_FILE="docker-compose-hanoi${USE_NO_SECURITY}${USE_ARM64}.yml"
curl -o docker-compose.yml "${HANOI_RELEASE_URL}/${COMPOSE_FILE}"