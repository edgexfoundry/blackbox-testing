#!/bin/bash

export volume=nexus3.edgexfoundry.org:10004/docker-edgex-volume:master
export consul=consul:1.1.0
export configSeed=nexus3.edgexfoundry.org:10004/docker-core-config-seed-go:0.7.0
export mongo=nexus3.edgexfoundry.org:10004/docker-edgex-mongo:0.6.0

export coreData=nexus3.edgexfoundry.org:10004/docker-core-data-go:0.7.0
export coreMetadata=nexus3.edgexfoundry.org:10004/docker-core-metadata-go:0.7.0
export coreCommand=nexus3.edgexfoundry.org:10004/docker-core-command-go:0.7.0

export supportLogging=nexus3.edgexfoundry.org:10004/docker-support-logging-go:0.7.0
export supportNotifications=nexus3.edgexfoundry.org:10004/docker-support-notifications-go:0.7.0
export supportScheduler=nexus3.edgexfoundry.org:10004/docker-support-scheduler:0.5.0
export supportRulesengine=nexus3.edgexfoundry.org:10004/docker-support-rulesengine:0.5.0

export exportClient=nexus3.edgexfoundry.org:10004/docker-export-client-go:0.7.0
export exportDistro=nexus3.edgexfoundry.org:10004/docker-export-distro-go:0.7.0
export deviceVirtual=nexus3.edgexfoundry.org:10004/docker-device-virtual:0.5.0
