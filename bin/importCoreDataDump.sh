#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

DATA_BASE="coredata"
COLLECTIONS=( "event" "reading" "valueDescriptor" )
DUMP_FILES=( $EVENTDATADUMP $READINGDATADUMP $VDDATADUMP)

for index in "${!DUMP_FILES[@]}"
do
    docker-compose exec -T mongo /bin/bash -c "mongoimport -d ${DATA_BASE} -c ${COLLECTIONS[index]} --file ${DUMP_FILES[index]}"

    echo "Info: ${DUMP_FILES[index]} data imported"
done