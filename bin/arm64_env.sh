#!/bin/bash

export volume=nexus3.edgexfoundry.org:10004/docker-edgex-volume-arm64:1.0.0
export consul=nexus3.edgexfoundry.org:10001/arm64v8/consul:1.3.1
export configSeed=nexus3.edgexfoundry.org:10004/docker-core-config-seed-go-arm64:1.0.0
export mongo=nexus3.edgexfoundry.org:10004/docker-edgex-mongo-arm64:1.0.1

export coreData=nexus3.edgexfoundry.org:10004/docker-core-data-go-arm64:1.0.1
export coreMetadata=nexus3.edgexfoundry.org:10004/docker-core-metadata-go-arm64:1.0.1
export coreCommand=nexus3.edgexfoundry.org:10004/docker-core-command-go-arm64:1.0.1

export supportLogging=nexus3.edgexfoundry.org:10004/docker-support-logging-go-arm64:1.0.1
export supportNotifications=nexus3.edgexfoundry.org:10004/docker-support-notifications-go-arm64:1.0.1
export supportScheduler=nexus3.edgexfoundry.org:10004/docker-support-scheduler-go-arm64:1.0.1
export supportRulesengine=nexus3.edgexfoundry.org:10004/docker-support-rulesengine-arm64:edinburgh

export exportClient=nexus3.edgexfoundry.org:10004/docker-export-client-go-arm64:1.0.1
export exportDistro=nexus3.edgexfoundry.org:10004/docker-export-distro-go-arm64:1.0.1
export deviceVirtual=nexus3.edgexfoundry.org:10004/docker-device-virtual-go-arm64:1.0.0

export vault=nexus3.edgexfoundry.org:10004/docker-edgex-vault-arm64:1.0.0
export vaultWorker=nexus3.edgexfoundry.org:10004/docker-edgex-vault-worker-go-arm64:1.0.0
export kongdb=postgres:9.5
export kong=nexus3.edgexfoundry.org:10004/kong-arm:14
export edgexProxy=nexus3.edgexfoundry.org:10004/docker-edgex-proxy-go-arm64:1.0.0

export postman=nexus3.edgexfoundry.org:10004/postman-newman-arm64:3.9.4
