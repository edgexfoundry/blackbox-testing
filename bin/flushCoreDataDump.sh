#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh
EVENTDUMPJS=/etc/newman/javascript/coredata/event.js
READINGDUMPJS=/etc/newman/javascript/coredata/reading.js
VDDUMPJS=/etc/newman/javascript/coredata/valueDescriptor.js


if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

DATA_BASE="coredata"
FLUSH_SCRIPTS=( $EVENTDUMPJS $READINGDUMPJS $VDDUMPJS)

for index in "${!FLUSH_SCRIPTS[@]}"
do
    docker-compose exec -T mongo /bin/bash -c "mongo ${DATA_BASE} ${FLUSH_SCRIPTS[index]}"

    echo "Info: ${FLUSH_SCRIPTS[index]} data flushed"

done
