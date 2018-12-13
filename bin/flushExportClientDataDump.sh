#!/bin/bash

COLLECTION_PATH="collections/export-client-cleaner.postman_collection.json"
ENV_PATH="environment/export-client-docker.postman_environment.json"


echo "Info: Clean ExportClient's test data."

docker-compose run --rm postman run ${COLLECTION_PATH} --environment=${ENV_PATH}

echo "Info: ExportClient's test data Cleaned"
