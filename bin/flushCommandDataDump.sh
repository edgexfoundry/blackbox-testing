#!/bin/bash

COLLECTION_PATH="collections/core-command-cleaner.postman_collection.json"
ENV_PATH="environment/core-metadata-docker.postman_environment.json"


echo "Info: Clean CoreCommand's test data."

docker-compose run --rm postman run ${COLLECTION_PATH} --environment=${ENV_PATH}

echo "Info: CoreCommand's test data Cleaned"
