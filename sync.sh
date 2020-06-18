#!/bin/bash

# TODO: Change URl and file spec to use edgexfoundry master once developer-scripts PR is merged
NIGHT_BUILD_URL="https://codeload.github.com/lenny-intel/developer-scripts/zip/multi2"
FILE_SPEC="developer-scripts-multi2/releases/nightly-build/compose-files/*"

# x86_64 or arm64 for make run option
[ "$(uname -m)" != "x86_64" ] && USE_ARM64="arm64"

# security or no security for make run option
[ "$SECURITY_SERVICE_NEEDED" != true ] && USE_NO_SECURITY="no-secty"

# Download and extract all the docker compose files
curl -o compose-files.zip ${NIGHT_BUILD_URL}
unzip -o -j compose-files.zip ${FILE_SPEC} -d compose-files

(
  cd compose-files
  make gen ${USE_NO_SECURITY} ${USE_ARM64}
  mv docker-compose.yml ../
  mv Makefile ../
  mv .env ../
)

rm -f compose-files.zip
rm -rf compose-files