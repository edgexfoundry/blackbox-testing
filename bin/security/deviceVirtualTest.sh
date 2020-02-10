#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

COLLECTION_PATH="collections/device-virtual.postman_collection.json"
ENV_PATH="environment/device-virtual-docker-security.postman_environment.json"

if [ -f $NAMESFILE ]; then

	. $NAMESFILE

else
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating DeviceVirtual Test."

echo "[info] ---------- use docker-compose run newman ----------"

source $(dirname "$0")/security/setupSecurityAccount.sh -useradd

docker-compose -f ../docker-compose-test-tools.yml run --rm postman run ${COLLECTION_PATH} \
  --environment=${ENV_PATH} --reporters="junit,cli" --insecure --global-var accessToken="$TOKEN"

source $(dirname "$0")/security/setupSecurityAccount.sh -userdel

echo "Info:DeviceVirtual Test Completed."
