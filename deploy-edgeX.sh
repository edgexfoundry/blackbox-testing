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

if [ "$SECURITY_SERVICE_NEEDED" = "true" ]; then
	export SECURITY_IS_ON="true"
else
	export SECURITY_IS_ON="false"
fi

run_service volume

run_service consul

run_service config-seed

if [ "$SECURITY_SERVICE_NEEDED" = "true" ]; then

	run_service vault

	sleep 20s

	run_service vault-worker

	run_service kong-db

	sleep 10s

	run_service kong-migrations

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

run_service system

run_service device-virtual

run_service app-service-configurable

sleep 100s # Wait for rulesengine fully startup, because it takes around 100s on Raspberry Pi

echo "------- volume ------"
docker logs edgex-files
echo "------- consul ------"
docker logs edgex-core-consul
echo "------- config-seed ------"
docker logs edgex-config-seed
echo "------- vault ------"
docker logs edgex-vault
echo "------- vault-worker ------"
docker logs edgex-vault-worker
echo "------- kong-db ------"
docker logs kong-db
echo "------- kong-migrations ------"
docker logs kong-migration
echo "------- kong ------"
docker logs kong
echo "------- edgex-proxy ------"
docker logs edgex-proxy
echo "------- mongo ------"
docker logs edgex-mongo
echo "------- logging ------"
docker logs edgex-support-logging
echo "------- data ------"
docker logs edgex-core-data
echo "------- export-client ------"
docker logs edgex-export-client
echo "------- export-distro ------"
docker logs edgex-export-distro
echo "------- rulesengine ------"
docker logs edgex-support-rulesengine
echo "------- notifications ------"
docker logs edgex-support-notifications
echo "------- metadata ------"
docker logs edgex-core-metadata
echo "------- command ------"
docker logs edgex-core-command
echo "------- scheduler ------"
docker logs edgex-support-scheduler
echo "------- edgex-sys-mgmt-agent ------"
docker logs edgex-sys-mgmt-agent
echo "------- device-virtual ------"
docker logs edgex-device-virtual
echo "------- app-service-configurable ------"
docker logs edgex-app-service-configurable
echo "---------------------------------------------------------"
