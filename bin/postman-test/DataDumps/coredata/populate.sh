#!/usr/bin/env bash

mongoimport -d coredata -c event --file eventDb.json
mongoimport -d coredata -c reading --file readingDb.json
mongoimport -d coredata -c valueDescriptor --file valueDescriptorDb.json
