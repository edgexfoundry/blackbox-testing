#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh
ADDRESSABLE_JS=/etc/newman/javascript/command/addressable.js
DEVICE_JS=/etc/newman/javascript/command/device.js
COMMAND_JS=/etc/newman/javascript/command/command.js
DEVICPROFILE_JS=/etc/newman/javascript/command/deviceProfile.js
DEVICESERVICE_JS=/etc/newman/javascript/command/deviceService.js

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

DATA_BASE="metadata"
FLUSH_SCRIPTS=( $ADDRESSABLE_JS $DEVICE_JS $DEVICPROFILE_JS $DEVICESERVICE_JS $COMMAND_JS )

for index in "${!FLUSH_SCRIPTS[@]}"
do
    docker-compose exec -T mongo /bin/bash -c "mongo ${DATA_BASE} ${FLUSH_SCRIPTS[index]}"

    echo "Info: ${FLUSH_SCRIPTS[index]} data flushed"

done
