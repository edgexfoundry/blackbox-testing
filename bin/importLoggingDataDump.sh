#!/bin/bash

DATA_BASE="logging"

DUMP_FILES=(
    "/etc/newman/DataDumps/logging/logEntry.js"
)

for index in "${!DUMP_FILES[@]}"
do
    docker-compose exec -T mongo /bin/bash -c "mongo ${DATA_BASE} ${DUMP_FILES[index]}"
done