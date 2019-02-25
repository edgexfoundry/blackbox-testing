#!/bin/bash

RT=$(docker exec -i edgex-vault sh -c "cat /vault/config/assets/resp-init.json")
ROOTKEY=$(echo $RT | sed 's/.*"\(.*\)"[^"]*$/\1/')
echo $ROOTKEY