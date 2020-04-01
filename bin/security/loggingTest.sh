#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

COLLECTION_PATH="collections/support-logging.postman_collection.json"
ENV_PATH="environment/support-logging-docker-security.postman_environment.json"

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating Logging Test."

echo "[info] ---------- use docker-compose run newman ----------"

source $(dirname "$0")/security/setupSecurityAccount.sh -useradd

docker-compose -f ${docker_compose_test_tools} run --rm postman run ${COLLECTION_PATH} \
    --folder="logs" --iteration-data="data/loggingData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --insecure --global-var accessToken="$TOKEN"

docker-compose -f ${docker_compose_test_tools} run --rm postman run ${COLLECTION_PATH} \
    --folder="logs_error_4xx" --iteration-data="data/loggingData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --insecure --global-var accessToken="$TOKEN"

docker-compose -f ${docker_compose_test_tools} run --rm postman run ${COLLECTION_PATH} \
    --folder="ping" --iteration-data="data/loggingData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --insecure --global-var accessToken="$TOKEN"

source $(dirname "$0")/security/setupSecurityAccount.sh -userdel

echo "Info:Command Test Completed."
