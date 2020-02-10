#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

COLLECTION_PATH="collections/core-data.postman_collection.json"
ENV_PATH="environment/core-data-docker-security.postman_environment.json"

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating Coredata Test."

echo "[info] ---------- use docker-compose run newman ----------"

source $(dirname "$0")/security/setupSecurityAccount.sh -useradd

docker-compose -f ../docker-compose-test-tools.yml run --rm postman run ${COLLECTION_PATH} \
    --folder="reading" --iteration-data="data/readingData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --insecure --global-var accessToken="$TOKEN"
docker-compose -f ../docker-compose-test-tools.yml run --rm postman run ${COLLECTION_PATH} \
    --folder="reading_error_4xx" --iteration-data="data/readingData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --insecure --global-var accessToken="$TOKEN"

docker-compose -f ../docker-compose-test-tools.yml run --rm postman run ${COLLECTION_PATH} \
    --folder="valuedescriptor" --iteration-data="data/valueDescriptorData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --insecure --global-var accessToken="$TOKEN"
docker-compose -f ../docker-compose-test-tools.yml run --rm postman run ${COLLECTION_PATH} \
    --folder="valuedescriptor_error_4xx" --iteration-data="data/valueDescriptorData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --insecure --global-var accessToken="$TOKEN"

docker-compose -f ../docker-compose-test-tools.yml run --rm postman run ${COLLECTION_PATH} \
    --folder="event" --iteration-data="data/eventData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --insecure --global-var accessToken="$TOKEN"
docker-compose -f ../docker-compose-test-tools.yml run --rm postman run ${COLLECTION_PATH} \
    --folder="event_error_4xx" --iteration-data="data/eventData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --insecure --global-var accessToken="$TOKEN"

source $(dirname "$0")/security/setupSecurityAccount.sh -userdel

echo "Info:Coredata Test Completed."
