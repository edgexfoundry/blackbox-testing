#!/usr/bin/env bash

mongoimport -d metadata -c addressable --file addressableDb.json
mongoimport -d metadata -c command --file commandDb.json
mongoimport -d metadata -c device --file deviceDb.json
mongoimport -d metadata -c deviceProfile --file deviceProfileDb.json
mongoimport -d metadata -c deviceReport --file deviceReportDb.json
mongoimport -d metadata -c deviceService --file deviceserviceDb.json
mongoimport -d metadata -c provisionWatcher --file provisioWatcherDb.json
mongoimport -d metadata -c schedule --file scheduleDb.json
mongoimport -d metadata -c scheduleEvent --file scheduleEventDb.json
