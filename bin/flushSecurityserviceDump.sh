#!/bin/bash

COLLECTION_PATH="collections/security-cleaner.postman_collection.json"
ENV_PATH="environment/security-docker.postman_environment.json"
DOCKER_NETWORK="edgex-network"

echo "Info: Clean Securityservice's test data."

docker-compose run --rm postman run ${COLLECTION_PATH} --environment=${ENV_PATH}

docker run –-network=${DOCKER_NETWORK} edgexfoundry/docker-edgex-security-proxy-setup-go --init=false --userdel=jerry

echo "Info: Securityservice's test data Cleaned"
