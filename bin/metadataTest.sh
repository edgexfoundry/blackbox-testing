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

#echo "[info] ======================== Start run metaData test - schedule ========================"
#
#docker-compose run --rm postman run ${COLLECTION_PATH} \
#    --folder="schedule" --iteration-data="data/scheduleData.json" --environment=${ENV_PATH} \
#    --reporters="junit,cli"
#
#docker-compose run --rm postman run ${COLLECTION_PATH} \
#    --folder="schedule_error_4xx" --iteration-data="data/scheduleData.json" --environment=${ENV_PATH} \
#    --reporters="junit,cli"
#
#echo "[info] ======================== Start run metaData test - scheduleevent ========================"
#
#docker-compose run --rm postman run ${COLLECTION_PATH} \
#    --folder="scheduleevent" --iteration-data="data/scheduleEventData.json" --environment=${ENV_PATH} \
#    --reporters="junit,cli"
#
#docker-compose run --rm postman run ${COLLECTION_PATH} \
#    --folder="scheduleevent_error_4xx" --iteration-data="data/scheduleEventData.json" --environment=${ENV_PATH} \
#    --reporters="junit,cli"



##Addressable -200 status Code
#newman run $METADATA_COLLFILE --folder addressable -d $ADDRESSABLE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $ADDRESSABLE_200FILE
## Addressable - 4XX status Code
#newman run $METADATA_COLLFILE --folder addressable_error_4xx -d $ADDRESSABLE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $ADDRESSABLE_4XXFILE
#
## Command - 200 Status COde
#newman run $METADATA_COLLFILE --folder command -d $COMMAND_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $COMMAND_200FILE
## Command - 4XX Status COde
#newman run $METADATA_COLLFILE --folder command_error_4xx -d $COMMAND_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $COMMAND_4XXFILE
#
## Device - 200 Status COde
#newman run $METADATA_COLLFILE --folder device -d $DEVICE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICE_200FILE
## Device - 4XX Status COde
#newman run $METADATA_COLLFILE --folder device_error_4xx -d $DEVICE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICE_4XXFILE
#
## DeviceManager - 200 Status COde
#newman run $METADATA_COLLFILE --folder devicemanager -d $DEVICEMANAGER_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICEMANAGER_200FILE
## DeviceManager - 4XX Status COde
#newman run $METADATA_COLLFILE --folder devicemanager_error_4xx -d $DEVICEMANAGER_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICEMANAGER_4XXFILE
#
## DeviceProfile - 200 Status COde
#newman run $METADATA_COLLFILE --folder deviceprofile -d $DEVICEPROFILE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICEPROFILE_200FILE
## DeviceProfile - 4XX Status COde
#newman run $METADATA_COLLFILE --folder deviceprofile_error_4xx -d $DEVICEPROFILE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICEPROFILE_4XXFILE

## DeviceReport - 200 Status COde
#newman run $METADATA_COLLFILE --folder devicereport -d $DEVICEREPORT_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICEREPORT_200FILE
## DeviceReport - 4XX Status COde
#newman run $METADATA_COLLFILE --folder devicereport_error_4xx -d $DEVICEREPORT_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICEREPORT_4XXFILE
#
## DeviceService - 200 Status Code
#newman run $METADATA_COLLFILE --folder deviceservice -d $DEVICESERVICE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICESERVICE_200FILE
## DeviceService - 4XX Status Code
#newman run $METADATA_COLLFILE --folder deviceservice_error_4xx -d $DEVICESERVICE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICESERVICE_4XXFILE

## ProvisionWatcher - 200 Status Code
#newman run $METADATA_COLLFILE --folder provisionwatcher -d $PROVISION_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $PROVISIONWATCHER_200FILE
## ProvisionWatcher - 4XX Status Code
#newman run $METADATA_COLLFILE --folder provisionwatcher_error_4xx -d $PROVISION_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $PROVISIONWATCHER_4XXFILE
#
## Schedule - 200 Status Code
#newman run $METADATA_COLLFILE --folder schedule -d $SCHEDULE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $SCHEDULE_200FILE
#
## Schedule - 4XX Status Code
#newman run $METADATA_COLLFILE --folder schedule_error_4xx -d $SCHEDULE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $SCHEDULE_4XXFILE
#
## ScheduleEvent - 200 Status Code
#newman run $METADATA_COLLFILE --folder scheduleevent -d $SCHEDULEEVENT_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $SCHEDULEEVENT_200FILE
#
## ScheduleEvent - 4XX Status Code
#newman run $METADATA_COLLFILE --folder scheduleevent_error_4xx -d $SCHEDULEEVENT_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $SCHEDULEEVENT_4XXFILE

echo "Info: Metadata Test completed."

