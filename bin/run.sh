#!/bin/bash
# Ensure we fail the job if any steps fail
set -e -o pipefail

#. $(dirname "$0")/env.sh

option="${1}"

echo " ${option}"

TIMESTAMPFORMAT=`date +%d-%m-%Y_%H%M%S`
BASEPATH=$(dirname "$0")/postman-test/scriptLogs
COREDATALOGSPATH=$BASEPATH/coreData$TIMESTAMPFORMAT.log
METADATALOGSPATH=$BASEPATH/metaData$TIMESTAMPFORMAT.log
COMMANDLOGSPATH=$BASEPATH/command$TIMESTAMPFORMAT.log
LOGGINGLOGSPATH=$BASEPATH/logging$TIMESTAMPFORMAT.log
SUPPORT_NOTIFICATION_LOG_PATH=$BASEPATH/supportNotification$TIMESTAMPFORMAT.log
EXPORTCLIENTLOGSPATH=$BASEPATH/command$TIMESTAMPFORMAT.log
RULESENGINELOGSPATH=$BASEPATH/rulesengine$TIMESTAMPFORMAT.log
EDGEXLOGSPATH=$BASEPATH/edgex$TIMESTAMPFORMAT.log

coreDataTest() {

	$(dirname "$0")/importCoreDataDump.sh
	$(dirname "$0")/coreDataTest.sh
	$(dirname "$0")/flushCoreDataDump.sh

}


metaDataTest() {

 	$(dirname "$0")/importMetaDataDumps.sh
 	$(dirname "$0")/metadataTest.sh
	$(dirname "$0")/flushMetaDataDump.sh

}

commandTest() {

	$(dirname "$0")/importCommandDataDump.sh
	$(dirname "$0")/commandTest.sh
	$(dirname "$0")/flushCommandDataDump.sh

}


loggingTest() {

  	$(dirname "$0")/importLoggingDataDump.sh
	$(dirname "$0")/loggingTest.sh
	$(dirname "$0")/flushLoggingDataDump.sh

}

supportNotificationTest(){
	$(dirname "$0")/importSupportNotificationDump.sh
	$(dirname "$0")/supportNotificationsTest.sh
	$(dirname "$0")/flushSupportNotificationDump.sh

}

exportClientTest() {
	$(dirname "$0")/importExportClientDataDump.sh
	$(dirname "$0")/exportClientTest.sh
	$(dirname "$0")/flushExportClientDataDump.sh

}

rulesengineTest() {
	$(dirname "$0")/rulesengineTest.sh
}

testAll() {

	coreDataTest
	metaDataTest
	commandTest
	loggingTest
	supportNotificationTest
	exportClientTest
	rulesengineTest

}

#Main Script starts here
$(dirname "$0")/banner.sh

echo "[INFO] Init postman test data ."
VOLUME_CONTAINER=$(docker-compose ps -q volume)
VOLUME_CONTAINER=`echo ${VOLUME_CONTAINER} | cut -b 1-12`

docker cp $(dirname "$0")/postman-test/. "${VOLUME_CONTAINER}":/etc/newman


case ${option} in
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
	commandTest	| tee $COMMANDLOGSPATH
	;;
	-log)
	echo "Info: Initiating Logging Test"
	loggingTest	| tee $LOGGINGLOGSPATH
	;;
   	-sn)
    echo "Info: Initiating SupportNotifications Test"
	supportNotificationTest	| tee $SUPPORT_NOTIFICATION_LOG_PATH
    ;;
  	-exc)
    echo "Info: Initiating ExportClient Test"
    exportClientTest | tee $EXPORTCLIENTLOGSPATH
    ;;
    -ru)
    echo "Info: Initiating SupportRulesengine Test"
    rulesengineTest	| tee $RULESENGINELOGSPATH
    ;;
   	-all)
    echo "Info: Initiating EdgeX Test"
	testAll		| tee $EDGEXLOGSPATH
    ;;
   	*)
    echo "`basename ${0}`:usage: [-cd Coredata] | [-md Metadata] | [-co Command] | [-sn SupportNotification] | [-lo Logging] | [-exc Export Client] | [-ru Rulesengine] | [-all All]"
    echo
    exit 0
    ;;
esac


echo "[INFO] Fetch postman test result ."
docker cp "${VOLUME_CONTAINER}":/etc/newman/newman/. $(dirname "$0")/testResult

echo
echo "Info: Logs available in [scriptLogs]"
#echo "Info: HTML Reports available in [Reports]"
echo
$(dirname "$0")/endBanner.sh



