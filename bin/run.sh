#!/bin/bash

# Set security environment variable. This is mostly cosmetic as the tests will display warnings that
# the env is not set.
if [ "$SECURITY_SERVICE_NEEDED" = "true" ]; then
	export SECURITY_IS_ON="true"
else
	export SECURITY_IS_ON="false"
fi

# Ensure we fail the job if any steps fail
set -e -o pipefail

# Run the compose file for blackbox testing
export network=$(docker network ls | awk '{print $2}' | grep edgex-network)
docker-compose -f "$(dirname "$0")"/../docker-compose-test-tools.yml up -d app-service-configurable

TIMESTAMPFORMAT=$(date +%d-%m-%Y_%H%M%S)
BASEPATH=$(dirname "$0")/postman-test/scriptLogs
SECURITYLOGSPATH=$BASEPATH/securityservice$TIMESTAMPFORMAT.log
COREDATALOGSPATH=$BASEPATH/coreData$TIMESTAMPFORMAT.log
METADATALOGSPATH=$BASEPATH/metaData$TIMESTAMPFORMAT.log
COMMANDLOGSPATH=$BASEPATH/command$TIMESTAMPFORMAT.log
LOGGINGLOGSPATH=$BASEPATH/logging$TIMESTAMPFORMAT.log
SUPPORT_NOTIFICATION_LOG_PATH=$BASEPATH/supportNotification$TIMESTAMPFORMAT.log
SUPPORT_SCHEDULER_LOG_PATH=$BASEPATH/supportScheduler$TIMESTAMPFORMAT.log
SYSTEMMANAGEMENTLOGSPATH=$BASEPATH/systemmanagement$TIMESTAMPFORMAT.log
DEVICEVIRTUALLOGSPATH=$BASEPATH/devicevirtual$TIMESTAMPFORMAT.log
APPSERVICECONFIGURABLELOGSPATH=$BASEPATH/appserviceconfigurable$TIMESTAMPFORMAT.log
EDGEXLOGSPATH=$BASEPATH/edgex$TIMESTAMPFORMAT.log

securityTest() {
	pushd "$(dirname "$0")" >/dev/null

	. $(dirname "$0")/setupSecurityserviceTest.sh
	$(dirname "$0")/runSecurityserviceTest.sh
	$(dirname "$0")/cleanSecurityserviceTest.sh

	popd >/dev/null
}

coreDataTest() {
	pushd "$(dirname "$0")" >/dev/null

	if [ "$SECURITY_SERVICE_NEEDED" = "true" ]; then
		source ./security/importCoreDataDump.sh
		source ./security/coreDataTest.sh
		source ./security/flushCoreDataDump.sh
	else
		./importCoreDataDump.sh
		./coreDataTest.sh
		./flushCoreDataDump.sh
	fi

	popd >/dev/null
}

metaDataTest() {
	pushd "$(dirname "$0")" >/dev/null

	if [ "$SECURITY_SERVICE_NEEDED" = "true" ]; then
		source ./security/importMetaDataDumps.sh
		source ./security/metadataTest.sh
		source ./security/flushMetaDataDump.sh
	else
		./importMetaDataDumps.sh
		./metadataTest.sh
		./flushMetaDataDump.sh
	fi

	popd >/dev/null
}

commandTest() {
	pushd "$(dirname "$0")" >/dev/null

	if [ "$SECURITY_SERVICE_NEEDED" = "true" ]; then
		source ./security/importCommandDataDump.sh
		source ./security/commandTest.sh
		source ./security/flushCommandDataDump.sh
	else
		./importCommandDataDump.sh
		./commandTest.sh
		./flushCommandDataDump.sh
	fi

	popd >/dev/null
}

loggingTest() {
	pushd "$(dirname "$0")" >/dev/null

	if [ "$SECURITY_SERVICE_NEEDED" = "true" ]; then
		source ./security/importLoggingDataDump.sh
		source ./security/loggingTest.sh
		source ./security/flushLoggingDataDump.sh
	else
		./importLoggingDataDump.sh
		./loggingTest.sh
		./flushLoggingDataDump.sh
	fi

	popd >/dev/null
}

supportNotificationTest() {
	pushd "$(dirname "$0")" >/dev/null

	if [ "$SECURITY_SERVICE_NEEDED" = "true" ]; then
		source ./security/importSupportNotificationDump.sh
		source ./security/supportNotificationsTest.sh
		source ./security/flushSupportNotificationDump.sh
	else
		./importSupportNotificationDump.sh
		./supportNotificationsTest.sh
		./flushSupportNotificationDump.sh
	fi

	popd >/dev/null
}

systemManagementTest() {
	pushd "$(dirname "$0")" >/dev/null

	./systemManagementTest.sh

	popd >/dev/null
}

supportSchedulerTest() {
	pushd "$(dirname "$0")" >/dev/null

	if [ "$SECURITY_SERVICE_NEEDED" = "true" ]; then
		source ./security/importSupportSchedulerDump.sh
		source ./security/supportSchedulerTest.sh
		source ./security/flushSupportSchedulerDataDump.sh
	else
		./importSupportSchedulerDump.sh
		./supportSchedulerTest.sh
		./flushSupportSchedulerDataDump.sh
	fi

	popd >/dev/null
}

deviceVirtualTest() {
	pushd "$(dirname "$0")" >/dev/null

	if [ "$SECURITY_SERVICE_NEEDED" = "true" ]; then
		source ./security/deviceVirtualTest.sh
	else
		./deviceVirtualTest.sh
	fi

	popd >/dev/null
}

appServiceConfigurableTest() {
	pushd "$(dirname "$0")" >/dev/null
	
	./appServiceConfigurableTest.sh

	popd >/dev/null
}

testAll() {
	deviceVirtualTest
	appServiceConfigurableTest
	coreDataTest
	commandTest
	metaDataTest
	supportNotificationTest
	supportSchedulerTest
	systemManagementTest

	if [ "$SECURITY_SERVICE_NEEDED" = "true" ]; then
		securityTest
	fi

}

## Changing MaxResultCount value to 100 before test
echo "[INFO] Update MaxResultCount and restart services "
$(dirname "$0")/updateMaxResultCount.sh >/dev/null 2>&1

#Main Script starts here
$(dirname "$0")/banner.sh

#Create testResult for postman
[ -d "$(dirname "$0")/testResult" ] || mkdir $(dirname "$0")/testResult

case $1 in
-sec)
	echo "Info: Initiating Securityservice Test"
	securityTest | tee $SECURITYLOGSPATH
	;;
-cd)
	echo "Info: Initiating Coredata Test"
	coreDataTest | tee $COREDATALOGSPATH
	;;
-md)
	echo "Info: Initiating Metadata Test"
	metaDataTest | tee $METADATALOGSPATH
	;;
-co)
	echo "Info: Initiating Command Test"
	commandTest | tee $COMMANDLOGSPATH
	;;
-log)
	echo "Info: Initiating Logging Test"
	loggingTest | tee $LOGGINGLOGSPATH
	;;
-sn)
	echo "Info: Initiating SupportNotifications Test"
	supportNotificationTest | tee $SUPPORT_NOTIFICATION_LOG_PATH
	;;
-ss)
	echo "Info: Initiating SupportScheduler Test"
	supportSchedulerTest | tee $SUPPORT_SCHEDULER_LOG_PATH
	;;
-dv)
	echo "Info: Initiating DeviceVirtual Test"
	deviceVirtualTest | tee $DEVICEVIRTUALLOGSPATH
	;;
-asc)
	echo "Info: Initiating AppServiceConfigurable Test"
	appServiceConfigurableTest | tee $APPSERVICECONFIGURABLELOGSPATH
	;;
-sys)
	echo "Info: Initiating SystemManagement Test"
	systemManagementTest | tee $SYSTEMMANAGEMENTLOGSPATH
	;;
-all)
	echo "Info: Initiating EdgeX Test"
	testAll | tee $EDGEXLOGSPATH
	;;
*)
	echo "$(basename ${0}):usage: [-cd Coredata] | [-md Metadata] | [-co Command] | [-sn SupportNotification] | [-lo Logging] | [-ss SupportScheduler] | [-dv DeviceVirtual] | [-asc AppServiceConfigurable] | [-sec securityTest] | [-all All]"
	echo
	exit 0
	;;
esac

echo
echo "Info: Logs available in [scriptLogs]"
#echo "Info: HTML Reports available in [Reports]"
echo
$(dirname "$0")/endBanner.sh
