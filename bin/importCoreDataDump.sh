#!/bin/bash

COLLECTION_PATH="collections/core-data-importer.postman_collection.json"
ENV_PATH="environment/core-data-docker.postman_environment.json"


echo "Info: import Coredata's test data."

docker-compose run --rm postman run ${COLLECTION_PATH} --environment=${ENV_PATH}

echo "Info: Coredata's test data imported"
