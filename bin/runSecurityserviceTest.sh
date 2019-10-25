#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

COLLECTION_PATH="collections/security-service-docker.postman_collection.json"
ENV_PATH="environment/security-service-docker.postman_environment.json"

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating Securityservice Test."

#OT=$(docker-compose run edgex-proxy --init=false --useradd=jerry --group=admin | tail -1)
#TOKEN=$( echo $OT | sed 's/.*: \([^.]*\).*/\1/')
#echo $TOKEN

#RT=$(docker exec -i edgex-vault sh -c "cat /vault/config/assets/resp-init.json")
#ROOTKEY=$(echo $RT | sed 's/.*"\(.*\)"[^"]*$/\1/')
#echo $ROOTKEY

echo "[info] ---------- use docker-compose run newman ----------"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --environment=${ENV_PATH} --insecure --reporters="junit,cli" --global-var accessToken=$TOKEN --global-var rootKey=$ROOTKEY


#docker run --rm --user="1000" -v "${PWD}/bin/postman-test":/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 run ${COLLECTION_PATH} \
#    --folder="event" --iteration-data="data/eventData.json" --environment=${ENV_PATH} \
#    --reporters="junit,cli"
#docker run --rm --user="1000" -v "${PWD}/bin/postman-test":/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 run ${COLLECTION_PATH} \
#    --folder="event_error_4xx" --iteration-data="data/eventData.json" --environment=${ENV_PATH} \
#    --reporters="junit,cli"
#
#docker run --rm --user="1000" -v "${PWD}/bin/postman-test":/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 run ${COLLECTION_PATH} \
#    --folder="reading" --iteration-data="data/readingData.json" --environment=${ENV_PATH} \
#    --reporters="junit,cli"
#docker run --rm --user="1000" -v "${PWD}/bin/postman-test":/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 run ${COLLECTION_PATH} \
#    --folder="reading_error_4xx" --iteration-data="data/readingData.json" --environment=${ENV_PATH} \
#    --reporters="junit,cli"
#
#docker run --rm --user="1000" -v "${PWD}/bin/postman-test":/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 run ${COLLECTION_PATH} \
#    --folder="valuedescriptor" --iteration-data="data/valueDescriptorData.json" --environment=${ENV_PATH} \
#    --reporters="junit,cli"
#docker run --rm --user="1000" -v "${PWD}/bin/postman-test":/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 run ${COLLECTION_PATH} \
#    --folder="valuedescriptor_error_4xx" --iteration-data="data/valueDescriptorData.json" --environment=${ENV_PATH} \
#    --reporters="junit,cli"





#    WORKSPACE=/Users/bruce/Documents/eclipse-workspace/deploy-edgeX/
#
#	echo "[info] not jenkins build"

#newman run $COREDATACOLLFILE --folder event -d $EVENTDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $EVENTREPORT200FILE
#
#newman run $COREDATACOLLFILE --folder reading -d $READINGDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $READINGREPORT200FILE
#
#newman run $COREDATACOLLFILE --folder valuedescriptor -d $VDDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $VDREPORT200FILE
#
#newman run $COREDATACOLLFILE --folder event_error_4xx -d $EVENTDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $EVENTREPORT4XXFILE
#
#newman run $COREDATACOLLFILE --folder reading_error_4xx -d $READINGDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $READINGREPORT4XXFILE
#
#newman run $COREDATACOLLFILE --folder valuedescriptor_error_4xx -d $VDDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $VDREPORT4XXFILE

echo "Info:Securityservice Test Completed."
