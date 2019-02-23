#!/bin/bash

COLLECTION_PATH="collections/support-scheduler-importer.postman_collection.json"
ENV_PATH="environment/support-scheduler-docker.postman_environment.json"


echo "Info: import Support Scheduler's test data."

docker-compose run --rm postman run ${COLLECTION_PATH} --environment=${ENV_PATH}

echo "Info: Support Scheduler's test data imported"