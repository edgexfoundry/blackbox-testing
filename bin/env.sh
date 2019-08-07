#!/bin/bash

export volume=nexus3.edgexfoundry.org:10004/docker-edgex-volume:1.0.0
export consul=consul:1.3.1
export configSeed=nexus3.edgexfoundry.org:10004/docker-core-config-seed-go:1.0.0
export mongo=nexus3.edgexfoundry.org:10004/docker-edgex-mongo:1.0.1

export coreData=nexus3.edgexfoundry.org:10004/docker-core-data-go:1.0.1
export coreMetadata=nexus3.edgexfoundry.org:10004/docker-core-metadata-go:1.0.1
export coreCommand=nexus3.edgexfoundry.org:10004/docker-core-command-go:1.0.1

export supportLogging=nexus3.edgexfoundry.org:10004/docker-support-logging-go:1.0.1
export supportNotifications=nexus3.edgexfoundry.org:10004/docker-support-notifications-go:1.0.1
export supportScheduler=nexus3.edgexfoundry.org:10004/docker-support-scheduler-go:1.0.1
export supportRulesengine=nexus3.edgexfoundry.org:10004/docker-support-rulesengine:1.0.0

export exportClient=nexus3.edgexfoundry.org:10004/docker-export-client-go:1.0.1
export exportDistro=nexus3.edgexfoundry.org:10004/docker-export-distro-go:1.0.1
export deviceVirtual=nexus3.edgexfoundry.org:10004/docker-device-virtual-go:1.0.0

export vault=nexus3.edgexfoundry.org:10004/docker-edgex-vault:1.0.0
export vaultWorker=nexus3.edgexfoundry.org:10004/docker-edgex-vault-worker-go:1.0.0
export kongdb=postgres:9.5
export kong=kong:1.0.3
export edgexProxy=nexus3.edgexfoundry.org:10004/docker-edgex-proxy-go:1.0.0

export postman=postman/newman
