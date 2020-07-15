#!/bin/bash

if [ -n "${COMPOSE_FILE_PATH}" ] && [ -r "${COMPOSE_FILE_PATH}" ]; then
	COMPOSE_FILE=${COMPOSE_FILE_PATH}
else
	COMPOSE_FILE=docker-compose.yml
fi
docker-compose -f docker-compose-test-tools.yml down
docker-compose -p edgex -f ${COMPOSE_FILE} down
