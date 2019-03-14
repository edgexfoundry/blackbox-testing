#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

COLLECTION_PATH="collections/core-metadata.postman_collection.json"
ENV_PATH="environment/core-metadata-docker.postman_environment.json"

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating Metadata Test."

echo "[info] ---------- use docker-compose run newman ----------"

echo "[info] ======================== Start run metaData test - addressable ========================"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="addressable" --iteration-data="data/addressableData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"
    
docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="addressable_error_4xx" --iteration-data="data/addressableData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"    

echo "[info] ======================== Start run metaData test - command ========================"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="command" --iteration-data="data/commandData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"  

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="command_error_4xx" --iteration-data="data/commandData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"  

echo "[info] ======================== Start run metaData test - device ========================"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="device" --iteration-data="data/deviceData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="device_error_4xx" --iteration-data="data/deviceData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

echo "[info] ======================== Start run metaData test - deviceprofile ========================"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="deviceprofile" --iteration-data="data/deviceProfileData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="deviceprofile_error_4xx" --iteration-data="data/deviceProfileData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

echo "[info] ======================== Start run metaData test - devicereport ========================"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="devicereport" --iteration-data="data/deviceReportData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="devicereport_error_4xx" --iteration-data="data/deviceReportData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

echo "[info] ======================== Start run metaData test - deviceservice ========================"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="deviceservice" --iteration-data="data/deviceServiceData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="deviceservice_error_4xx" --iteration-data="data/deviceServiceData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

echo "[info] ======================== Start run metaData test - provisionwatcher ========================"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="provisionwatcher" --iteration-data="data/provisionWatcherData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="provisionwatcher_error_4xx" --iteration-data="data/provisionWatcherData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

echo "Info: Metadata Test completed."

