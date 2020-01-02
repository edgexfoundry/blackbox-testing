#!/bin/sh

VOLUME_CONTAINER=$(docker-compose -f $(ls ../ | awk '/docker-compose/ && !/test-tools/') ps -q volume)
VOLUME_CONTAINER=`echo ${VOLUME_CONTAINER} | cut -b 1-12`

echo "VOLUME_CONTAINER ${VOLUME_CONTAINER}"
docker cp $(dirname "$0")/bin/postman-test/. "${VOLUME_CONTAINER}":/etc/newman
docker-compose -f $(ls ../ | awk '/docker-compose/ && !/test-tools/') exec -T  volume ls /etc/newman/