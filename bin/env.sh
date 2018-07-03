#!/bin/bash

export volume=edgexfoundry/docker-edgex-volume
export consul=consul:1.1.0
export coreConfigseed=edgexfoundry/docker-core-config-seed-go:0.6.0

export mongo=edgexfoundry/docker-edgex-mongo:0.6.0
export mongoSeed=edgexfoundry/docker-edgex-mongo-seed

export coreData=edgexfoundry/docker-core-data-go:0.6.0
export coreMetadata=edgexfoundry/docker-core-metadata-go:0.6.0
export coreCommand=edgexfoundry/docker-core-command-go:0.6.0

export supportLogging=edgexfoundry/docker-support-logging-go:0.6.0
export supportNotification=edgexfoundry/docker-support-notifications:0.6.0
export supportScheduler=edgexfoundry/docker-support-scheduler:0.6.0
export supportRulesengine=edgexfoundry/docker-support-rulesengine:0.6.0

export deviceVirtual=edgexfoundry/docker-device-virtual:0.6.0

export exportClient=edgexfoundry/docker-export-client:0.2.1
export exportDistro=edgexfoundry/docker-export-distro-go:0.6.0