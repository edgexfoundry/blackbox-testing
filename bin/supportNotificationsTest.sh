#!/bin/bash

COLLECTION_PATH="collections/support-notifications.postman_collection.json"
ENV_PATH="environment/support-notification${ENV_SUFFIX}.postman_environment.json"

echo "Info: Initiating Support Notifications Test."

echo "[info] ---------- use docker-compose run newman ----------"

docker-compose -f ${docker_compose_test_tools} run --rm postman run ${COLLECTION_PATH} --folder="subscription" --iteration-data="data/subscriptionData.json"  --environment=${ENV_PATH} --reporters="junit,cli"
docker-compose -f ${docker_compose_test_tools} run --rm postman run ${COLLECTION_PATH} --folder="notification" --iteration-data="data/notificationData.json"  --environment=${ENV_PATH} --reporters="junit,cli"
docker-compose -f ${docker_compose_test_tools} run --rm postman run ${COLLECTION_PATH} --folder="transmission" --iteration-data="data/transmissionData.json"  --environment=${ENV_PATH} --reporters="junit,cli"
docker-compose -f ${docker_compose_test_tools} run --rm postman run ${COLLECTION_PATH} --folder="ping"  --environment=${ENV_PATH} --reporters="junit,cli"

echo "Info:Support-Notification Test Completed."

