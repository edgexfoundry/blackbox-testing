#!/bin/bash

export volume=nexus3.edgexfoundry.org:10004/docker-edgex-volume-arm64:1.0.0
export consul=nexus3.edgexfoundry.org:10001/arm64v8/consul:1.3.1
export configSeed=nexus3.edgexfoundry.org:10004/docker-core-config-seed-go-arm64:1.1.0
export mongo=nexus3.edgexfoundry.org:10004/docker-edgex-mongo-arm64:1.1.0

export coreData=nexus3.edgexfoundry.org:10004/docker-core-data-go-arm64:1.1.0
export coreMetadata=nexus3.edgexfoundry.org:10004/docker-core-metadata-go-arm64:1.1.0
export coreCommand=nexus3.edgexfoundry.org:10004/docker-core-command-go-arm64:1.1.0

export supportLogging=nexus3.edgexfoundry.org:10004/docker-support-logging-go-arm64:1.1.0
export supportNotifications=nexus3.edgexfoundry.org:10004/docker-support-notifications-go-arm64:1.1.0
export supportScheduler=nexus3.edgexfoundry.org:10004/docker-support-scheduler-go-arm64:1.1.0
export supportRulesengine=nexus3.edgexfoundry.org:10004/docker-support-rulesengine-arm64:master

export exportClient=nexus3.edgexfoundry.org:10004/docker-export-client-go-arm64:1.1.0
export exportDistro=nexus3.edgexfoundry.org:10004/docker-export-distro-go-arm64:1.1.0
export deviceVirtual=nexus3.edgexfoundry.org:10004/docker-device-virtual-go-arm64:1.1.0
export appService=nexus3.edgexfoundry.org:10004/docker-app-service-configurable-arm64:latest

export vault=nexus3.edgexfoundry.org:10004/docker-edgex-secret-store-go-arm64:1.1.0
export vaultWorker=nexus3.edgexfoundry.org:10004/docker-edgex-security-secretstore-setup-go-arm64:1.1.0
export kongdb=postgres:9.6
export kong=kong:1.3.0-ubuntu
export edgexProxy=nexus3.edgexfoundry.org:10004/docker-edgex-security-proxy-setup-go-arm64:1.1.0

export postman=nexus3.edgexfoundry.org:10003/edgex-newman:4.5.1-arm64