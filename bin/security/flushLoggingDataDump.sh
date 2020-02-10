#!/bin/bash

COLLECTION_PATH="collections/support-logging-cleaner.postman_collection.json"
ENV_PATH="environment/support-logging-docker-security.postman_environment.json"


echo "Info: Clean Logging's test data."

source $(dirname "$0")/security/setupSecurityAccount.sh -useradd

docker-compose -f ../docker-compose-test-tools.yml run --rm postman run ${COLLECTION_PATH} --environment=${ENV_PATH} \
  --insecure --global-var accessToken="$TOKEN"

source $(dirname "$0")/security/setupSecurityAccount.sh -userdel

echo "Info: Logging's test data cleaned"
