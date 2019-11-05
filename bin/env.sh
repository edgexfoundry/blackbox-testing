#!/bin/bash

export volume=nexus3.edgexfoundry.org:10004/docker-edgex-volume:1.1.0
export consul=consul:1.3.1
export configSeed=nexus3.edgexfoundry.org:10004/docker-core-config-seed-go:1.1.0
export mongo=nexus3.edgexfoundry.org:10004/docker-edgex-mongo:1.1.0

export coreData=nexus3.edgexfoundry.org:10004/docker-core-data-go:1.1.0
export coreMetadata=nexus3.edgexfoundry.org:10004/docker-core-metadata-go:1.1.0
export coreCommand=nexus3.edgexfoundry.org:10004/docker-core-command-go:1.1.0

export supportLogging=nexus3.edgexfoundry.org:10004/docker-support-logging-go:1.1.0
export supportNotifications=nexus3.edgexfoundry.org:10004/docker-support-notifications-go:1.1.0
export supportScheduler=nexus3.edgexfoundry.org:10004/docker-support-scheduler-go:1.1.0
export supportRulesengine=nexus3.edgexfoundry.org:10004/docker-support-rulesengine:1.0.0

export exportClient=nexus3.edgexfoundry.org:10004/docker-export-client-go:1.1.0
export exportDistro=nexus3.edgexfoundry.org:10004/docker-export-distro-go:1.1.0
export deviceVirtual=nexus3.edgexfoundry.org:10004/docker-device-virtual-go:1.1.0
export appService=nexus3.edgexfoundry.org:10004/docker-app-service-configurable:latest
export systemManagement=nexus3.edgexfoundry.org:10004/docker-sys-mgmt-agent-go:1.1.0

export vault=nexus3.edgexfoundry.org:10004/docker-edgex-secret-store-go:1.1.0
export vaultWorker=nexus3.edgexfoundry.org:10004/docker-edgex-security-secretstore-setup-go:1.1.0
export kongdb=postgres:9.6
export kong=kong:1.0.4-centos
export edgexProxy=nexus3.edgexfoundry.org:10004/docker-edgex-security-proxy-setup-go:1.1.0

export postman=postman/newman
