var dbName = 'notifications';
var collectionName = 'transmission' ;
var documents =[];

// Test case : Query transmissions by associating notification’s slug with limited returned records
documents.push(
    {
        "notification": {
            "$ref": "notification",
            "$id": ObjectId("57ba04a1189b95b8afcdafd1")
        },
        "receiver": "Jack",
        "channel": {
            "type": "REST",
            "url": "http://localhost:5566/test",
            "httpMethod": "POST",
            "_class" : "org.edgexfoundry.support.domain.notifications.RESTfulChannel" ,
        },
        "status": "SENT",
        "resendCount": 0,
        "records": [
            {
                "status": "SENT",
                "response": "true",
                "sent": 1472439914709
            }
        ],
        "created": 1472439915730,
        "modified": 1472439915730
    }
);

// Test case : Query transmissions by creation timestamp between start date and end date. with limited returned records
documents.push(
    {
        "receiver": "Jack",
        "channel": {
            "type": "REST",
            "url": "http://localhost:5566/test",
            "httpMethod": "POST",
            "_class" : "org.edgexfoundry.support.domain.notifications.RESTfulChannel" ,
        },
        "status": "SENT",
        "resendCount": 0,
        "records": [
            {
                "status": "SENT",
                "response": "true",
                "sent": 1472439914709
            }
        ],
        "created": 100010,
        "modified": 100010
    }
);

// Test case : Query transmissions by creation timestamp after start date with limited returned records
documents.push(
    {
        "receiver": "Jack",
        "channel": {
            "type": "REST",
            "url": "http://localhost:5566/test",
            "httpMethod": "POST",
            "_class" : "org.edgexfoundry.support.domain.notifications.RESTfulChannel" ,
        },
        "status": "SENT",
        "resendCount": 0,
        "records": [
            {
                "status": "SENT",
                "response": "true",
                "sent": 1472439914709
            }
        ],
        "created": 150000,
        "modified": 150000
    }
);

// Test case : Query transmissions by creation timestamp before end date with limited returned records
documents.push(
    {
        "receiver": "Jack",
        "channel": {
            "type": "REST",
            "url": "http://localhost:5566/test",
            "httpMethod": "POST",
            "_class" : "org.edgexfoundry.support.domain.notifications.RESTfulChannel" ,
        },
        "status": "SENT",
        "resendCount": 0,
        "records": [
            {
                "status": "SENT",
                "response": "true",
                "sent": 1472439914709
            }
        ],
        "created": 99000,
        "modified": 99000
    }
);

// Test case : Query the escalated transmissions (status = ESCALATED) with limited returned records
documents.push(
    {
        "receiver": "Jack",
        "channel": {
            "type": "REST",
            "url": "http://localhost:5566/test",
            "httpMethod": "POST",
            "_class" : "org.edgexfoundry.support.domain.notifications.RESTfulChannel" ,
        },
        "status": "ESCALATED",
        "resendCount": 0,
        "records": [
            {
                "status": "SENT",
                "response": "true",
                "sent": 1472439914709
            }
        ],
        "created": 100000,
        "modified": 100000
    }
);

// Test case : Query the failed transmissions (status = FAILED) with limited returned records
documents.push(
    {
        "receiver": "Jack",
        "channel": {
            "type": "REST",
            "url": "http://localhost:5566/test",
            "httpMethod": "POST",
            "_class" : "org.edgexfoundry.support.domain.notifications.RESTfulChannel" ,
        },
        "status": "FAILED",
        "resendCount": 0,
        "records": [
            {
                "status": "FAILED",
                "response": "true",
                "sent": 1472439914709
            }
        ],
        "created": 100000,
        "modified": 100000
    }
);

// Test case :  Delete the sent transmissions (status = SENT) when the current timestamp minus their last modification timestamp is less than the age parameter
documents.push(
    {
        "notification": {
            "$ref": "notification",
            "$id": ObjectId("57ba04a1189b95b8afcdafd2")
        },
        "receiver": "Jack",
        "channel": {
            "type": "REST",
            "url": "http://localhost:5566/test",
            "httpMethod": "POST",
            "_class" : "org.edgexfoundry.support.domain.notifications.RESTfulChannel" ,
        },
        "status": "SENT",
        "resendCount": 0,
        "records": [
            {
                "status": "SENT",
                "response": "true",
                "sent": 1472439914709
            }
        ],
        "created": 100000,
        "modified": 100000
    }
);

// Test case : Delete the escalated transmissions (status = ESCALATED) when the current timestamp minus their last modification timestamp is less than the age parameter
documents.push(
    {
        "notification": {
            "$ref": "notification",
            "$id": ObjectId("57ba04a1189b95b8afcdafd3")
        },
        "receiver": "Jack",
        "channel": {
            "type": "REST",
            "url": "http://localhost:5566/test",
            "httpMethod": "POST",
            "_class" : "org.edgexfoundry.support.domain.notifications.RESTfulChannel" ,
        },
        "status": "ESCALATED",
        "resendCount": 0,
        "records": [
            {
                "status": "ESCALATED",
                "response": "true",
                "sent": 1472439914709
            }
        ],
        "created": 100000,
        "modified": 100000
    }
);

// Test case : Delete the acknowledged tTransmissions (status = ACKNOWLEDGED) when the current timestamp minus their last modification timestamp is less than the age parameter
documents.push(
    {
        "notification": {
            "$ref": "notification",
            "$id": ObjectId("57ba04a1189b95b8afcdafd4")
        },
        "receiver": "Jack",
        "channel": {
            "type": "REST",
            "url": "http://localhost:5566/test",
            "httpMethod": "POST",
            "_class" : "org.edgexfoundry.support.domain.notifications.RESTfulChannel" ,
        },
        "status": "ACKNOWLEDGED",
        "resendCount": 0,
        "records": [
            {
                "status": "SENT",
                "response": "true",
                "sent": 1472439914709
            }
        ],
        "created": 100000,
        "modified": 100000
    }
);

// Test case : Delete the failed transmissions (status = FAILED and resendCount >= resend limit) when the current timestamp minus their last modification timestamp is less than the age parameter
documents.push(
    {
        "notification": {
            "$ref": "notification",
            "$id": ObjectId("57ba04a1189b95b8afcdafd5")
        },
        "receiver": "Jack",
        "channel": {
            "type": "REST",
            "url": "http://localhost:5566/test",
            "httpMethod": "POST",
            "_class" : "org.edgexfoundry.support.domain.notifications.RESTfulChannel" ,
        },
        "status": "FAILED",
        "resendCount": 3,
        "records": [
            {
                "status": "FAILED",
                "response": "true",
                "sent": 1472439914709
            }
        ],
        "created": 100000,
        "modified": 100000
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
