mongoimport -d metadata -c addressable --file addressableDb.json
mongoimport -d metadata -c command --file commandDb.json
mongoimport -d metadata -c device --file deviceDb.json
mongoimport -d metadata -c deviceProfile --file deviceProfileDb.json
mongoimport -d metadata -c deviceService --file deviceServiceDb.json
