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

run_service () {
	echo "\033[0;32mStarting.. $1\033[0m"
	docker-compose up -d $1
}

run_service volume
run_service consul

run_service config-seed

if [ "$SECURITY_SERVICE_NEEDED" = "true" ]; then

	run_service consul

	run_service vault

	run_service vault-worker

	run_service kong-db

	run_service kong-migration

	sleep 10s

	run_service kong

	sleep 10s

	run_service edgex-proxy
fi

run_service mongo

run_service logging

run_service data

run_service export-client

run_service export-distro

run_service rulesengine

run_service notifications

run_service metadata

run_service command

run_service scheduler

run_service device-virtual

run_service app-service-configurable

sleep 100s # Wait for rulesengine fully startup, because it takes around 100s on Raspberry Pi
