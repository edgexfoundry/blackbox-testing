#!/bin/bash

export volume=edgexfoundry/docker-edgex-volume
export consul=consul:1.1.0
export configSeed=nexus3.edgexfoundry.org:10004/docker-core-config-seed-go:master
export mongo=edgexfoundry/docker-edgex-mongo:0.6.0

export coreData=nexus3.edgexfoundry.org:10004/docker-core-data-go
export coreMetadata=nexus3.edgexfoundry.org:10004/docker-core-metadata-go
export coreCommand=nexus3.edgexfoundry.org:10004/docker-core-command-go

export supportLogging=nexus3.edgexfoundry.org:10004/docker-support-logging
export supportNotifications=edgexfoundry/docker-support-notifications
export supportScheduler=edgexfoundry/docker-support-scheduler
export supportRulesengine=edgexfoundry/docker-support-rulesengine

export exportClient=edgexfoundry/docker-export-client
export exportDistro=edgexfoundry/docker-export-distro
export deviceVirtual=edgexfoundry/docker-device-virtual

