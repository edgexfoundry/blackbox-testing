#!/bin/bash

export volume=nexus3.edgexfoundry.org:10004/docker-edgex-volume:master
export consul=consul:1.1.0
export configSeed=nexus3.edgexfoundry.org:10004/docker-core-config-seed-go
export mongo=nexus3.edgexfoundry.org:10004/docker-edgex-mongo:master

export coreData=nexus3.edgexfoundry.org:10004/docker-core-data-go
export coreMetadata=nexus3.edgexfoundry.org:10004/docker-core-metadata-go
export coreCommand=nexus3.edgexfoundry.org:10004/docker-core-command-go

export supportLogging=nexus3.edgexfoundry.org:10004/docker-support-logging-go
export supportNotifications=nexus3.edgexfoundry.org:10004/docker-support-notifications
export supportScheduler=nexus3.edgexfoundry.org:10004/docker-support-scheduler
export supportRulesengine=nexus3.edgexfoundry.org:10004/docker-support-rulesengine

export exportClient=edgexfoundry/docker-export-client
export exportDistro=nexus3.edgexfoundry.org:10004/docker-export-distro-go
export deviceVirtual=nexus3.edgexfoundry.org:10004/docker-device-virtual

