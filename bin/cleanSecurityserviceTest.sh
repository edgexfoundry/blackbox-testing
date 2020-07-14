#!/bin/bash

echo "Info: Clean Securityservice's test data."

COMPOSE=$(dirname "$0")/../$(ls $(dirname "$0")/../ | awk '/docker-compose/ && !/test-tools/')
docker-compose -p edgex -f ${COMPOSE} run --rm --entrypoint /edgex/security-proxy-setup edgex-proxy --init=false --userdel=testuser

echo "Info: Securityservice's test data Cleaned"
