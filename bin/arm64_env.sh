#!/bin/bash

export volume=edgexfoundry/docker-edgex-volume
export consul=consul:1.1.0
export configSeed=nexus3.edgexfoundry.org:10004/docker-core-config-seed-go-arm64:master
export mongo=edgexfoundry/docker-edgex-mongo

export coreData=nexus3.edgexfoundry.org:10004/docker-core-data-go-arm64
export coreMetadata=nexus3.edgexfoundry.org:10004/docker-core-metadata-go-arm64
export coreCommand=nexus3.edgexfoundry.org:10004/docker-core-command-go-arm64

export supportLogging=edgexfoundry/docker-support-logging-go
export supportNotifications=edgexfoundry/docker-support-notifications
export supportScheduler=edgexfoundry/docker-support-scheduler
export supportRulesengine=edgexfoundry/docker-support-rulesengine

export exportClient=edgexfoundry/docker-export-client-go-arm64
export exportDistro=edgexfoundry/docker-export-distro-go-arm64
export deviceVirtual=edgexfoundry/docker-device-virtual

