#!/bin/bash

COLLECTION_PATH="collections/support-notifications-cleaner.postman_collection.json"
ENV_PATH="environment/support-notification-docker.postman_environment.json"


echo "Info: Clean SupportNotification's test data."

docker-compose run --rm postman run ${COLLECTION_PATH} --environment=${ENV_PATH}

echo "Info: SupportNotification's test data Cleaned"
