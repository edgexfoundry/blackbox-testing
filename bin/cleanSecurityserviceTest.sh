#!/bin/bash

echo "Info: Clean Securityservice's test data."

docker-compose run edgex-proxy --userdel=jerry

echo "Info: Securityservice's test data Cleaned"
