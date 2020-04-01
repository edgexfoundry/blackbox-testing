#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

COLLECTION_PATH="collections/core-command.postman_collection.json"
ENV_PATH="environment/core-command-docker-security.postman_environment.json"

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating Command Test."

echo "[info] ---------- use docker-compose run newman ----------"

source $(dirname "$0")/security/setupSecurityAccount.sh -useradd

docker-compose -f ${docker_compose_test_tools} run --rm postman run ${COLLECTION_PATH} \
    --folder="device" --iteration-data="data/coreCommandData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --insecure --global-var accessToken="$TOKEN"

docker-compose -f ${docker_compose_test_tools} run --rm postman run ${COLLECTION_PATH} \
    --folder="device_error_4xx" --iteration-data="data/coreCommandData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --insecure --global-var accessToken="$TOKEN"

source $(dirname "$0")/security/setupSecurityAccount.sh -userdel

echo "Info:Command Test Completed."
