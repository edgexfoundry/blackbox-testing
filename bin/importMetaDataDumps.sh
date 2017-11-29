#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

DATA_BASE="metadata"
COLLECTIONS=(
    "addressable" "deviceService" "device"
     "command" "deviceProfile" "provisionWatcher"
     "deviceReport" "schedule" "scheduleEvent")
DUMP_FILES=(
    $ADDRESSABLE_DATADUMP $DEVICESERVICE_DATADUMP $DEVICE_DATADUMP
    $COMMAND_DATADUMP $DEVICEPROFILE_DATADUMP $PROVISION_DATADUMP
    $DEVICEREPORT_DATADUMP $SCHEDULE_DATADUMP $SCHEDULEEVENT_DATADUMP )

for index in "${!DUMP_FILES[@]}"
do
    docker-compose exec -T mongo /bin/bash -c "mongoimport -d ${DATA_BASE} -c ${COLLECTIONS[index]} --file ${DUMP_FILES[index]}"

    echo "Info: ${DUMP_FILES[index]} data imported"
done