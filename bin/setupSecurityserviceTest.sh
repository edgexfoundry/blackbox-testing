#!/bin/bash

OT=$(docker-compose run edgex-proxy --init=false --useradd=jerry --group=admin | tail -1)
export TOKEN=$( echo $OT | sed 's/.*: \([^.]*\).*/\1/')

#echo $TOKEN

RT=$(docker exec -i edgex-vault sh -c "cat /vault/config/assets/resp-init.json")
export ROOTKEY=$(echo $RT | sed 's/.*"\(.*\)"[^"]*$/\1/')

#echo $ROOTKEY

echo "Info:Securityservice Setup Completed."

