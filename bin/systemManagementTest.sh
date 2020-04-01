#!/bin/bash


COLLECTION_PATH="collections/system-management.postman_collection.json"
ENV_PATH="environment/system-management-docker.postman_environment.json"

echo "Info: Initiating System Management Test."

echo "[info] ---------- use docker-compose run newman ----------"

docker-compose -f ${docker_compose_test_tools} run --rm postman run ${COLLECTION_PATH} \
    --folder="system-management" --environment=${ENV_PATH} --reporters="junit,cli"

echo "Info:System-Management Test Completed."

