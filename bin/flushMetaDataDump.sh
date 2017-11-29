#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

ADDRESSABLE_JS=/etc/newman/javascript/metadata/addressable.js
DEVICE_JS=/etc/newman/javascript/metadata/device.js
COMMAND_JS=/etc/newman/javascript/metadata/command.js
DEVICEMANAGER_JS=/etc/newman/javascript/metadata/deviceManager.js
DEVICPROFILE_JS=/etc/newman/javascript/metadata/deviceProfile.js
DEVICEREPORT_JS=/etc/newman/javascript/metadata/deviceReport.js
DEVICESERVICE_JS=/etc/newman/javascript/metadata/deviceService.js
PROVISIONWATCHER_JS=/etc/newman/javascript/metadata/provisionWatcher.js
SCHEDULE_JS=/etc/newman/javascript/metadata/schedule.js
SCHEDULEEVENT_JS=/etc/newman/javascript/metadata/scheduleEvent.js


if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

DATA_BASE="metadata"
FLUSH_SCRIPTS=( $ADDRESSABLE_JS $DEVICE_JS $DEVICEREPORT_JS $DEVICPROFILE_JS $DEVICESERVICE_JS $PROVISIONWATCHER_JS $SCHEDULE_JS $SCHEDULEEVENT_JS $COMMAND_JS )

for index in "${!FLUSH_SCRIPTS[@]}"
do
    docker-compose exec -T mongo /bin/bash -c "mongo ${DATA_BASE} ${FLUSH_SCRIPTS[index]}"

    echo "Info: ${FLUSH_SCRIPTS[index]} data flushed"

done
