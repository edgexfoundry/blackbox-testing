#!/bin/bash

declare -A IMAGES=(
    ["volume"]="edgexfoundry/docker-edgex-volume"
    ["consul"]="edgexfoundry/docker-core-consul"
    ["coreMetadata"]="edgexfoundry/docker-core-metadata"
    ["mongo"]="edgexfoundry/docker-edgex-mongo"
    ["mongoSeed"]="edgexfoundry/docker-edgex-mongo-seed"
    ["supportLogging"]="edgexfoundry/docker-support-logging"
    ["coreMetadata"]="edgexfoundry/docker-core-metadata"
    ["coreData"]="edgexfoundry/docker-core-data"
    ["coreCommand"]="edgexfoundry/docker-core-command"
    ["supportScheduler"]="edgexfoundry/docker-support-scheduler"
    ["exportClient"]="edgexfoundry/docker-export-client"
    ["exportDistro"]="edgexfoundry/docker-export-distro"
    ["supportRulesengine"]="edgexfoundry/docker-support-rulesengine"
    ["deviceVirtual"]="edgexfoundry/docker-device-virtual"
)

echo "TEST_SERVICE : ${TEST_SERVICE}"
echo "TEST_SERVICE replace default"
IMAGES["${TEST_SERVICE}"]="${TEST_SERVICE_IMAGE}"


for image in "${!IMAGES[@]}";
do
    echo "set env ${image} ${IMAGES[$image]}"
    export $image=${IMAGES[$image]}
done

echo "~~~~~~~~~~~~~~~~~!!!!!!!!!!!!"
echo "${coreMetadata}"
echo "${volume}"
echo "${consul}"
