#!/bin/bash

MaxResultCount="100"
consulkvURL="http://localhost:8500/v1/kv"

# Change MaxResultCount using consul API
curl -X PUT -d ${MaxResultCount} ${consulkvURL}/edgex/core/1.0/edgex-support-logging/Service/MaxResultCount

# Restart Services
docker restart edgex-support-logging
