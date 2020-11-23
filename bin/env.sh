#!/bin/bash

export appService=nexus3.edgexfoundry.org:10004/docker-app-service-configurable:master
export postman=postman/newman:4.5.6
export docker_compose_test_tools=$PWD/docker-compose-test-tools.yml

# Set test environment to either docker or localhost (snaps).
# If TEST_ENV is not set then docker will be used as default.
# Accepted values are: localhost
#export TEST_ENV=localhost
