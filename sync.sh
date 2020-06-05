#!/bin/bash

# TODO: Change URl to edgexfoundry master once developer-scripts PR is merged
NIGHT_BUILD_URL="https://github.com/lenny-intel/developer-scripts/archive/multi2.zip"

# so wget on windows can pull files
[ "$(uname -o)" = "Msys" ] && WINDOWS_WGET_OPTION="--no-check-certificate"

# Download and extract all the docker compose files
wget -q ${WINDOWS_WGET_OPTION} -O compose-files.zip ${NIGHT_BUILD_URL}
unzip -o -j compose-files.zip */nightly-build/compose-files/* -d compose-files
rm compose-files.zip