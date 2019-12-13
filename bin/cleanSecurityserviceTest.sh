#!/bin/bash

echo "Info: Clean Securityservice's test data."

docker-compose -f $(ls ../ | awk '/docker-compose/ && !/test-tools/') run edgex-proxy --init=false --userdel=jerry

echo "Info: Securityservice's test data Cleaned"
