#!/bin/bash

# Copyright 2017 Konrad Zapalowicz <bergo.torino@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Start EdgeX Foundry services in right order, as described:
# https://wiki.edgexfoundry.org/display/FA/Get+EdgeX+Foundry+-+Users

#if [ "${OS}" ==  "Windows_NT" ] ; then
#    echo " os =  ${OS}"
#    . $(dirname "$0")/bin/env-win10.sh
#else
#    . $(dirname "$0")/bin/env.sh
#fi

# x86_64 or arm64 for make run option
[ "$(uname -m)" != "x86_64" ] && USE_ARM64="arm64"

# security or no security for make run option
[ "$SECURITY_SERVICE_NEEDED" != true ] && USE_NO_SECURITY="no-secty"

if [ -n "${COMPOSE_FILE_PATH}" ] && [ -r "${COMPOSE_FILE_PATH}" ]; then
	COMPOSE_FILE=${COMPOSE_FILE_PATH}
else
	sh ./sync.sh
fi

echo -e "\033[0;32mStarting services... $1\033[0m"
if [ "${COMPOSE_FILE}" != "" ]; then
  docker-compose -p edgex -f ${COMPOSE_FILE} up -d
else
  make run ${USE_NO_SECURITY} ${USE_ARM64}
fi

docker ps --format 'table {{.Names}}\t{{.Image}}' --filter "network=edgex_edgex-network" --filter "network=edgex_default"
