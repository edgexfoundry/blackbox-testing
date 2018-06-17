var dbName = 'notifications';
var collectionName = 'notification' ;
var documents =[];

// Test case : Fail to create a normal notification with a duplicated slug
documents.push(
    {
        "slug": "notice-001",
        "sender": "System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's temperature is 82 °F",
        "labels": [
            "room",
            "temperature"
        ]
    }
);

// Test case : Delete a specific notification by slug
documents.push(
    {
        "slug": "notice-003",
        "sender": "System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's temperature is 82 °F",
        "labels": [
            "room",
            "temperature"
        ]
    }
);

// Test case : Query a specific notification by slug
documents.push(
    {
        "slug": "notice-004",
        "sender": "System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's temperature is 82 °F",
        "labels": [
            "room",
            "temperature"
        ]
    }
);

// Test case : Query notifications by sender name with limited returned records
documents.push(
    {
        "slug": "notice-005",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's temperature is 82 °F",
        "labels": [
            "room",
            "temperature"
        ]
    }
);

documents.push(
    {
        "slug": "notice-006",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's relative humidity is 60 %",
        "labels": [
            "room",
            "humidity"
        ]
    }
);

documents.push(
    {
        "slug": "notice-007",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's temperature is 82 °F",
        "labels": [
            "room",
            "temperature"
        ]
    }
);

// Test case : Query notifications by creation timestamp between start date and end date with limited returned records
documents.push(
    {
        "slug": "notice-008",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's temperature is 82 °F",
        "labels": [
            "room",
            "temperature"
        ],
        "created":1300000
    }
);

documents.push(
    {
        "slug": "notice-009",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's relative humidity is 60 %",
        "labels": [
            "room",
            "humidity"
        ],
        "created":1300100
    }
);

documents.push(
    {
        "slug": "notice-010",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's temperature is 82 °F",
        "labels": [
            "room",
            "temperature"
        ],
        "created":1300200
    }
);

// Test case : Query notifications by creation timestamp after start date with limited returned records
documents.push(
    {
        "slug": "notice-011",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's temperature is 82 °F",
        "labels": [
            "room",
            "temperature"
        ],
        "created":1500001
    }
);

// Test case : Query notifications by creation timestamp before end date with limited returned records
documents.push(
    {
        "slug": "notice-012",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's temperature is 82 °F",
        "labels": [
            "room",
            "temperature"
        ],
        "created":1599999
    }
);

// Test case : Query notifications by labels matching any one of them with limited returned records
documents.push(
    {
        "slug": "notice-013",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Power meter's counter value is 356 kWh",
        "labels": [
            "room",
            "power-meter"
        ]
    }
);

// Test case : Query the unprocessed notifications (status = NEW) with limited returned records
documents.push(
    {
        "slug": "notice-014",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Power meter's counter value is 356 kWh",
        "labels": [
            "room",
            "power-meter"
        ],
        "status":"NEW"
    }
);

// Test case : Query transmissions by associating notification’s slug with limited returned records
documents.push(
    {
        "_id" : ObjectId("57ba04a1189b95b8afcdafd1"),
        "slug": "notice-015",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Power meter's counter value is 356 kWh",
        "labels": [
            "room",
            "power-meter"
        ],
        "status":"NEW"
    }
);

// Test case : Delete the sent transmissions (status = SENT) when the current timestamp minus their last modification timestamp is less than the age parameter
documents.push(
    {
        "_id" : ObjectId("57ba04a1189b95b8afcdafd2"),
        "slug": "notice-016",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Power meter's counter value is 356 kWh",
        "labels": [
            "room",
            "power-meter"
        ],
        "status":"PROCESSED"
    }
);

// Test case : Delete the escalated transmissions (status = ESCALATED) when the current timestamp minus their last modification timestamp is less than the age parameter
documents.push(
    {
        "_id" : ObjectId("57ba04a1189b95b8afcdafd3"),
        "slug": "notice-017",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Power meter's counter value is 356 kWh",
        "labels": [
            "room",
            "power-meter"
        ],
        "status":"PROCESSED"
    }
);

// Test case : Delete the acknowledged tTransmissions (status = ACKNOWLEDGED) when the current timestamp minus their last modification timestamp is less than the age parameter
documents.push(
    {
        "_id" : ObjectId("57ba04a1189b95b8afcdafd4"),
        "slug": "notice-018",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Power meter's counter value is 356 kWh",
        "labels": [
            "room",
            "power-meter"
        ],
        "status":"PROCESSED"
    }
);

// Test case : Delete the failed transmissions (status = FAILED and resendCount >= resend limit) when the current timestamp minus their last modification timestamp is less than the age parameter
documents.push(
    {
        "_id" : ObjectId("57ba04a1189b95b8afcdafd5"),
        "slug": "notice-019",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Power meter's counter value is 356 kWh",
        "labels": [
            "room",
            "power-meter"
        ],
        "status":"PROCESSED"
    }
);


try {

    var operationStatus = db[collectionName].insertMany(documents);

    print('[mongo js script] DB: '+ dbName + ' , collecation: ' + collectionName + ' , imported ' + operationStatus.insertedIds.length +' documents');


} catch (e) {
    print('[mongo js script] DB: '+ dbName + ' , collecation: ' + collectionName + ' , imported fail !! ');
    if("name" in e && e.name == 'BulkWriteError'){
        var wErrors = e.getWriteErrors();
        wErrors.forEach(function(doc){
            print(doc.errmsg);
        });
    }else{
        print(e);
    }
}
