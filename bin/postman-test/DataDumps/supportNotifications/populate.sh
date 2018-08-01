#!/usr/bin/env bash

mongoimport -d notifications -c subscription --file subscriptionDb.json
mongoimport -d notifications -c notification --file notificationDb.json
mongoimport -d notifications -c transmission --file transmissionDb.json