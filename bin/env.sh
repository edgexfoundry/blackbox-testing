#!/bin/bash

export volume=nexus3.edgexfoundry.org:10004/docker-edgex-volume:master
export consul=consul:1.3.1
export configSeed=nexus3.edgexfoundry.org:10004/docker-core-config-seed-go:master
export mongo=nexus3.edgexfoundry.org:10004/docker-edgex-mongo:master

export coreData=nexus3.edgexfoundry.org:10004/docker-core-data-go:master
export coreMetadata=nexus3.edgexfoundry.org:10004/docker-core-metadata-go:master
export coreCommand=nexus3.edgexfoundry.org:10004/docker-core-command-go:master

export supportLogging=nexus3.edgexfoundry.org:10004/docker-support-logging-go:master
export supportNotifications=nexus3.edgexfoundry.org:10004/docker-support-notifications-go:master
export supportScheduler=nexus3.edgexfoundry.org:10004/docker-support-scheduler-go:master
export supportRulesengine=nexus3.edgexfoundry.org:10004/docker-support-rulesengine:master

export deviceVirtual=nexus3.edgexfoundry.org:10004/docker-device-virtual-go:master
export appService=nexus3.edgexfoundry.org:10004/docker-app-service-configurable:latest
export systemManagement=nexus3.edgexfoundry.org:10004/docker-sys-mgmt-agent-go:master

export vault=nexus3.edgexfoundry.org:10004/docker-edgex-secret-store-go:master
export vaultWorker=nexus3.edgexfoundry.org:10004/docker-edgex-security-secretstore-setup-go:master
export kongdb=postgres:9.6
export kong=kong:1.3.0-centos
export edgexProxy=nexus3.edgexfoundry.org:10004/docker-edgex-security-proxy-setup-go:master

export postman=postman/newman
