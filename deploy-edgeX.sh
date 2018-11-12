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
sleep 10
run_service consul

while ! $(docker-compose exec -T consul nc -z edgex-core-consul 8500);do echo "not already startup… wait for 5 second reconnect." ;sleep 5; done

run_service config-seed
run_service mongo

sleep 10

run_service logging

while ! $(docker-compose exec -T consul nc -z edgex-support-logging 48061);do echo "not already startup… wait for 5 second reconnect." ;sleep 5; done
sleep 5

run_service notifications

while ! $(docker-compose exec -T consul nc -z edgex-support-notifications 48060);do echo "not already startup… wait for 5 second reconnect." ;sleep 5; done
sleep 5

run_service metadata

while ! $(docker-compose exec -T consul nc -z edgex-core-metadata 48081);do echo "not already startup… wait for 5 second reconnect." ;sleep 5; done
sleep 5

run_service data

while ! $(docker-compose exec -T consul nc -z edgex-core-data 48080);do echo "not already startup… wait for 5 second reconnect." ;sleep 5; done
sleep 5

run_service command

while ! $(docker-compose exec -T consul nc -z edgex-core-command 48082);do echo "not already startup… wait for 5 second reconnect." ;sleep 5; done
sleep 5

#run_service scheduler

#while ! $(docker-compose exec -T consul nc -z edgex-support-scheduler 48085);do echo "not already startup… wait for 5 second reconnect." ;sleep 5; done
#sleep 5

run_service export-client

while ! $(docker-compose exec -T consul nc -z edgex-export-client 48071);do echo "not already startup… wait for 5 second reconnect." ;sleep 5; done
sleep 5

run_service export-distro

while ! $(docker-compose exec -T consul nc -z edgex-export-distro 48070);do echo "not already startup… wait for 5 second reconnect." ;sleep 5; done
sleep 5

run_service rulesengine

while ! $(docker-compose exec -T consul nc -z edgex-support-rulesengine 48075);do echo "not already startup… wait for 5 second reconnect." ;sleep 5; done
sleep 5

#run_service device-virtual
