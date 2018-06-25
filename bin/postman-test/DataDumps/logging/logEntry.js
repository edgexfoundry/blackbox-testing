var dbName = 'logging';
var collectionName = 'logEntry' ;
var documents =[];

// Test case : Query logs
for(var i =0 ; i <= 20 ; i++){
    documents.push(
        {
            "logLevel" : "TRACE",
            "labels" : [
                "testLabel"
            ],
            "originService" : "testService",
            "message" : "Hello, this is testService !",
            "created" : NumberLong(1527780479547)
        }
    );
    documents.push(
        {
            "logLevel" : "DEBUG",
            "labels" : [
                "testLabel"
            ],
            "originService" : "testService",
            "message" : "Hello, this is testService !",
            "created" : NumberLong(1527780479547)
        }
    );
    documents.push(
        {
            "logLevel" : "INFO",
            "labels" : [
                "testLabel"
            ],
            "originService" : "testService",
            "message" : "Hello, this is testService !",
            "created" : NumberLong(1527780479547)
        }
    );
    documents.push(
        {
            "logLevel" : "WARN",
            "labels" : [
                "testLabel"
            ],
            "originService" : "testService",
            "message" : "Hello, this is testService !",
            "created" : NumberLong(1527780479547)
        }
    );
    documents.push(
        {
            "logLevel" : "ERROR",
            "labels" : [
                "testLabel"
            ],
            "originService" : "testService",
            "message" : "Hello, this is testService !",
            "created" : NumberLong(1527780479547)
        }
    );
}

documents.push(
    {
        "logLevel" : "WARN",
        "labels" : [
            "label1",
            "label2",
            "label3"
        ],
        "originService" : "service2",
        "message" : "Hello, Logging Service!",
        "created" : NumberLong(1527780479547)
    }
);


documents.push(
    {
        "logLevel" : "WARN",
        "labels" : [
            "label1",
            "label2",
            "label3"
        ],
        "originService" : "service2",
        "message" : "Hello, Logging Service!",
        "created" : NumberLong(1527780479547)
    }
);


documents.push(
    {
        "logLevel" : "WARN",
        "labels" : [
            "label1",
            "label2"
        ],
        "originService" : "service3",
        "message" : "Hello, KeyWordTest Service!",
        "created" : NumberLong(1527780479547)
    }
);


documents.push(
    {
        "logLevel" : "ERROR",
        "labels" : [
            "label1",
            "label2"
        ],
        "originService" : "service4",
        "message" : "Hello, Logging Service!",
        "created" : NumberLong(1527780479547)
    }
);

documents.push(
    {
        "logLevel" : "ERROR",
        "labels" : [
            "label1",
            "label2",
            "label3"
        ],
        "originService" : "service5",
        "message" : "Hello, KeyWordTest Service!",
        "created" : NumberLong(1527780479547)
    }
);

documents.push(
    {
        "logLevel" : "ERROR",
        "labels" : [
            "label1",
            "label2",
            "label3"
        ],
        "originService" : "service6",
        "message" : "Hello, Logging Service!",
        "created" : NumberLong(1527780479547)
    }
);

documents.push(
    {
        "logLevel" : "ERROR",
        "labels" : [
            "label1",
            "label2"
        ],
        "originService" : "service7",
        "message" : "Hello, Logging Service!",
        "created" : NumberLong(1527780479547)
    }
);

documents.push(
    {
        "logLevel" : "WARN",
        "labels" : [
            "label1",
            "label2"
        ],
        "originService" : "service8",
        "message" : "Hello, Logging Service!",
        "created" : NumberLong(1527780479547)
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
