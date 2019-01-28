#!/bin/bash

COLLECTION_PATH="collections/support-scheduler-cleaner.postman_collection.json"
ENV_PATH="environment/support-scheduler-docker.postman_environment.json"


echo "Info: Clean Support Scheduler's test data."

docker-compose run --rm postman run ${COLLECTION_PATH} --environment=${ENV_PATH}

echo "Info: Support Scheduler's test data Cleaned"
