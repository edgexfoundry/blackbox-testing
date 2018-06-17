#!/bin/bash

DATA_BASE="notifications"

FLUSH_SCRIPT=/etc/newman/javascript/supportNotifications/flushScript.js

docker-compose exec -T mongo /bin/bash -c "mongo ${DATA_BASE} ${FLUSH_SCRIPT}"