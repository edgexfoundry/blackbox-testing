#!/bin/bash

COLLECTION_PATH="collections/support-logging-importer.postman_collection.json"
ENV_PATH="environment/support-logging-docker.postman_environment.json"


echo "Info: import Logging's test data."

docker-compose run --rm postman run ${COLLECTION_PATH} --environment=${ENV_PATH}

echo "Info: Logging's test data imported"
