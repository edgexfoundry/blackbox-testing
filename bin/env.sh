#!/bin/bash

export volume=edgexfoundry/docker-edgex-volume
export consul=consul:1.1.0
export coreConfigseed=edgexfoundry/docker-core-config-seed-go

export mongo=edgexfoundry/docker-edgex-mongo
export mongoSeed=edgexfoundry/docker-edgex-mongo-seed

export coreData=edgexfoundry/docker-core-data-go
export coreMetadata=edgexfoundry/docker-core-metadata-go
export coreCommand=edgexfoundry/docker-core-command-go

export supportLogging=edgexfoundry/docker-support-logging-go
export supportNotification=edgexfoundry/docker-support-notifications
export supportScheduler=edgexfoundry/docker-support-scheduler
export supportRulesengine=edgexfoundry/docker-support-rulesengine

export deviceVirtual=edgexfoundry/docker-device-virtual

export exportClient=edgexfoundry/docker-export-client-go
export exportDistro=edgexfoundry/docker-export-distro-go