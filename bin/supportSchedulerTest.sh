#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

COLLECTION_PATH="collections/support-scheduler.postman_collection.json"
ENV_PATH="environment/support-scheduler-docker.postman_environment.json"

if [ -f $NAMESFILE ]; then

	. $NAMESFILE

else
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating Support-Scheduler Test(s)."

echo "[info] ---------- use docker-compose run newman ----------"

echo "[info] ======================== Start run support scheduler tests ========================"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="interval" --iteration-data="data/intervalData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"


docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="intervalAction" --iteration-data="data/intervalActionData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"


echo "Info: Support-Scheduler Test(s) Completed."