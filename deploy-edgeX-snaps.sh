#!/bin/bash

# Set any of the following snap environment variables. Note you must also set TEST_ENV=localhost
# (in the env.sh file) as well. Note, EF_SNAP takes precedence over EF_CHANNEL and ASC_SNAP
# takes precedence over ASC_CHANNEL.

# If EF_CHANNEL is not set, it defaults to 'stable'.
#export EF_CHANNEL=

# If ASC_CHANNEL is not set, it defaults to 'stable'.
#export ASC_CHANNEL=

# If EF_SNAP is not set then EF_CHANNEL will be used.
# Accepted value: Expected absolute path of snap
#export EF_SNAP=

# If ASC_SNAP is not set then ASC_CHANNEL will be used.
# Accepted value: Expected absolute path of snap
# export ASC_SNAP=

timestamp() {
  local ts=""
  ts=$(date +"%Y-%m-%dT%T.%3N") # current time
  echo "$ts -"
}

if [ -z "${TEST_ENV}" ]; then
  echo "$(timestamp) TEST_ENV not set. Unable to continue"
  exit
elif [ "${TEST_ENV}" != localhost ]; then
  echo "$(timestamp) TEST_ENV not set to localhost. Unable to continue"
  exit
fi

echo "============================================================================================"
echo "                      Deploying edgex snap test service for Blackbox"
echo "============================================================================================"

echo "$(timestamp) Removing edgexfoundry snap (if already installed)..."
sudo snap remove edgexfoundry --purge

echo "$(timestamp) Removing edgex-app-service-configurable snap (if already installed)..."
sudo snap remove edgex-app-service-configurable

echo "$(timestamp) Installing edgexfoundry snap..."
EF_CHANNEL="${EF_CHANNEL:-stable}"

if [ -n "$EF_SNAP" ]; then
  sudo snap install "${EF_SNAP}" --dangerous
else
  sudo snap install edgexfoundry --channel="${EF_CHANNEL}"
fi

echo "$(timestamp) Installing application service configurable snap..."
ASC_CHANNEL="${ASC_CHANNEL:-stable}"

if [ -n "$ASC_SNAP" ]; then
  sudo snap install "${ASC_SNAP}" --dangerous
else
  sudo snap install edgex-app-service-configurable --channel="${ASC_CHANNEL}"
fi

echo "$(timestamp) Turning on sys-mgmt-agent service..."
sudo snap set edgexfoundry sys-mgmt-agent=on

echo "$(timestamp) Turning on support-scheduler service..."
sudo snap set edgexfoundry support-scheduler=on

echo "$(timestamp) Turning on support-notifications service..."
sudo snap set edgexfoundry support-notifications=on

echo "$(timestamp) Turning on device-virtual service..."
sudo snap set edgexfoundry device-virtual=on

echo "$(timestamp) Setting edgex-app-service-configurable profile to blackbox-tests..."
sudo snap set edgex-app-service-configurable profile=blackbox-tests

echo "$(timestamp) Starting edgex-app-service-configurable service..."
sudo snap start edgex-app-service-configurable.app-service-configurable

echo "============================================================================================"
echo "              Completed the deployment of edgex snap test service for Blackbox"
echo "============================================================================================"
