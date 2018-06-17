#!/bin/bash

COLLECTION_PATH="collections/support-notifications.postman_collection.json"
ENV_PATH="environment/edgex.postman_environment.json"

echo "Info: Initiating Support Notifications Test."

echo "[info] ---------- use docker-compose run newman ----------"

docker-compose run --rm postman run ${COLLECTION_PATH} --folder="subscription"  --environment=${ENV_PATH} --reporters="junit,cli"
docker-compose run --rm postman run ${COLLECTION_PATH} --folder="notification"  --environment=${ENV_PATH} --reporters="junit,cli"
docker-compose run --rm postman run ${COLLECTION_PATH} --folder="transmission"  --environment=${ENV_PATH} --reporters="junit,cli"
