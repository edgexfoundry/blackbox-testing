#!/bin/bash

export volume=nexus3.edgexfoundry.org:10004/docker-edgex-volume-arm64:0.6.0
export consul=nexus3.edgexfoundry.org:10001/arm64v8/consul:1.1.0
export configSeed=nexus3.edgexfoundry.org:10004/docker-core-config-seed-go-arm64:0.7.0
export mongo=nexus3.edgexfoundry.org:10004/docker-edgex-mongo-arm64:0.6.0

export coreData=nexus3.edgexfoundry.org:10004/docker-core-data-go-arm64:0.7.0
export coreMetadata=nexus3.edgexfoundry.org:10004/docker-core-metadata-go-arm64:0.7.0
export coreCommand=nexus3.edgexfoundry.org:10004/docker-core-command-go-arm64:0.7.0

export supportLogging=nexus3.edgexfoundry.org:10004/docker-support-logging-go-arm64:0.7.0
export supportNotifications=nexus3.edgexfoundry.org:10004/docker-support-notifications-go-arm64:0.7.0
export supportScheduler=nexus3.edgexfoundry.org:10004/docker-support-scheduler-go-arm64:0.7.0
export supportRulesengine=nexus3.edgexfoundry.org:10004/docker-support-rulesengine-arm64:0.7.0

export exportClient=nexus3.edgexfoundry.org:10004/docker-export-client-go-arm64:0.7.0
export exportDistro=nexus3.edgexfoundry.org:10004/docker-export-distro-go-arm64:0.7.0
export deviceVirtual=nexus3.edgexfoundry.org:10004/docker-device-virtual-arm64:0.6.0
export postman=nexus3.edgexfoundry.org:10004/postman-newman-arm64:3.9.4
