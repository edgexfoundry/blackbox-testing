#!/bin/bash

export volume=nexus3.edgexfoundry.org:10004/docker-edgex-volume-arm64:master
export consul=nexus3.edgexfoundry.org:10001/arm64v8/consul:1.3.1
export configSeed=nexus3.edgexfoundry.org:10004/docker-core-config-seed-go-arm64:master
export mongo=nexus3.edgexfoundry.org:10004/docker-edgex-mongo-arm64:master

export coreData=nexus3.edgexfoundry.org:10004/docker-core-data-go-arm64:master
export coreMetadata=nexus3.edgexfoundry.org:10004/docker-core-metadata-go-arm64:master
export coreCommand=nexus3.edgexfoundry.org:10004/docker-core-command-go-arm64:master

export supportLogging=nexus3.edgexfoundry.org:10004/docker-support-logging-go-arm64:master
export supportNotifications=nexus3.edgexfoundry.org:10004/docker-support-notifications-go-arm64:master
export supportScheduler=nexus3.edgexfoundry.org:10004/docker-support-scheduler-go-arm64:master
export supportRulesengine=nexus3.edgexfoundry.org:10004/docker-support-rulesengine-arm64:master

export deviceVirtual=nexus3.edgexfoundry.org:10004/docker-device-virtual-go-arm64:master
export appService=nexus3.edgexfoundry.org:10004/docker-app-service-configurable-arm64:latest
export systemManagement=nexus3.edgexfoundry.org:10004/docker-sys-mgmt-agent-go-arm64:master

export vault=nexus3.edgexfoundry.org:10004/docker-edgex-secret-store-go-arm64:master
export vaultWorker=nexus3.edgexfoundry.org:10004/docker-edgex-security-secretstore-setup-go-arm64:master
export kongdb=postgres:9.6
export kong=kong:1.3.0-ubuntu
export edgexProxy=nexus3.edgexfoundry.org:10004/docker-edgex-security-proxy-setup-go-arm64:master

export postman=nexus3.edgexfoundry.org:10003/edgex-newman:4.5.6-arm64
