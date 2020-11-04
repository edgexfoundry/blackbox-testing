#!/bin/bash

COLLECTION_PATH="collections/core-data-importer.postman_collection.json"
ENV_PATH="environment/core-data${ENV_SUFFIX}.postman_environment.json"


echo "Info: import Coredata's test data."

docker-compose -f ${docker_compose_test_tools} run --rm postman run ${COLLECTION_PATH} --environment=${ENV_PATH}

echo "Info: Coredata's test data imported"
