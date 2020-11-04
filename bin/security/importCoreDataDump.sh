#!/bin/bash

COLLECTION_PATH="collections/core-data-importer.postman_collection.json"
ENV_PATH="environment/core-data${ENV_SUFFIX}-security.postman_environment.json"

echo "Info: import Coredata's test data."

source $(dirname "$0")/security/setupSecurityAccount.sh -useradd

docker-compose -f ${docker_compose_test_tools} run --rm postman run ${COLLECTION_PATH} --environment=${ENV_PATH} \
  --insecure --global-var accessToken="$TOKEN"

source $(dirname "$0")/security/setupSecurityAccount.sh -userdel

echo "Info: Coredata's test data imported"
