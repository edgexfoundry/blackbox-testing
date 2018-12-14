#!/bin/bash

COLLECTION_PATH="collections/core-metadata-importer.postman_collection.json"
ENV_PATH="environment/core-metadata-docker.postman_environment.json"


echo "Info: import CoreMetadata's test data."

docker-compose run --rm postman run ${COLLECTION_PATH} --environment=${ENV_PATH}

echo "Info: CoreMetadata's test data imported"
