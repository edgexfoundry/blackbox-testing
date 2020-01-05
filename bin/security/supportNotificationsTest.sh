#!/bin/bash

COLLECTION_PATH="collections/support-notifications.postman_collection.json"
ENV_PATH="environment/support-notification-docker-security.postman_environment.json"

echo "Info: Initiating Support Notifications Test."

echo "[info] ---------- use docker-compose run newman ----------"

source $(dirname "$0")/security/setupSecurityAccount.sh -useradd

docker-compose -f ../docker-compose-test-tools.yml run --rm postman run ${COLLECTION_PATH} --folder="subscription" \
  --iteration-data="data/subscriptionData.json"  --environment=${ENV_PATH} --reporters="junit,cli" \
  --insecure --global-var accessToken="$TOKEN"
docker-compose -f ../docker-compose-test-tools.yml run --rm postman run ${COLLECTION_PATH} --folder="notification" \
  --iteration-data="data/notificationData.json"  --environment=${ENV_PATH} --reporters="junit,cli" \
  --insecure --global-var accessToken="$TOKEN"
docker-compose -f ../docker-compose-test-tools.yml run --rm postman run ${COLLECTION_PATH} --folder="transmission" \
  --iteration-data="data/transmissionData.json"  --environment=${ENV_PATH} --reporters="junit,cli" \
  --insecure --global-var accessToken="$TOKEN"
docker-compose -f ../docker-compose-test-tools.yml run --rm postman run ${COLLECTION_PATH} --folder="ping"  --environment=${ENV_PATH} \
  --reporters="junit,cli" --insecure --global-var accessToken="$TOKEN"

source $(dirname "$0")/security/setupSecurityAccount.sh -userdel

echo "Info:Support-Notification Test Completed."

