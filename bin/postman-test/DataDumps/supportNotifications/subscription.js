var dbName = 'notifications';
var collectionName = 'subscription' ;
var documents =[];

// Test case : Fail to create a subscription with a duplicated slug
documents.push(
    {
        "slug": "group-a-member",
        "receiver": "Group A Member",
        "subscribedCategories": [
            "HW_HEALTH"
        ],
        "subscribedLabels": [
            "temperature",
            "humidity"
        ],
        "channels": [
            {
                "type": "EMAIL",
                "_class" : "org.edgexfoundry.support.domain.notifications.EmailChannel" ,
                "mailAddresses": [
                    "andy@abc.def",
                    "tom@abc.def"
                ]
            }
        ]
    }
);

// Test case : Deleted Subscription can be removed by slug .

documents.push(
    {
        "slug": "group-b-member",
        "receiver": "Group B Member",
        "subscribedCategories": [
            "HW_HEALTH"
        ],
        "subscribedLabels": [
            "temperature",
            "humidity"
        ],
        "channels": [
            {
                "type": "EMAIL",
                "_class" : "org.edgexfoundry.support.domain.notifications.EmailChannel" ,
                "mailAddresses": [
                    "john@abc.def",
                    "sam@abc.def"
                ]
            }
        ]
    }
);

// Test case : Modify a subscription

documents.push(
    {
        "slug": "group-c-member",
        "receiver": "Group C Member",
        "subscribedCategories": [
            "HW_HEALTH"
        ],
        "subscribedLabels": [
            "temperature",
            "humidity"
        ],
        "channels": [
            {
                "type": "EMAIL",
                "_class" : "org.edgexfoundry.support.domain.notifications.EmailChannel" ,
                "mailAddresses": [
                    "karl@abc.def",
                    "jeff@abc.def"
                ]
            }
        ]
    }
);

// Test case : List all subscription

documents.push(
    {
        "slug": "group-d-member",
        "receiver": "Group D Member",
        "subscribedCategories": [
            "HW_HEALTH"
        ],
        "subscribedLabels": [
            "temperature",
            "humidity"
        ],
        "channels": [
            {
                "type": "EMAIL",
                "_class" : "org.edgexfoundry.support.domain.notifications.EmailChannel" ,
                "mailAddresses": [
                    "davis@abc.def",
                    "david@abc.def"
                ]
            }
        ]
    }
);

documents.push(
    {
        "slug": "group-e-member",
        "receiver": "Group E Member",
        "subscribedCategories": [
            "HW_HEALTH"
        ],
        "subscribedLabels": [
            "temperature",
            "humidity"
        ],
        "channels": [
            {
                "type": "EMAIL",
                "_class" : "org.edgexfoundry.support.domain.notifications.EmailChannel" ,
                "mailAddresses": [
                    "elliot@abc.def",
                    "elvin@abc.def"
                ]
            }
        ]
    }
);

// Test case : Query a specific subscription by slug

documents.push(
    {
        "slug": "group-f-member",
        "receiver": "Group F Member",
        "subscribedCategories": [
            "HW_HEALTH"
        ],
        "subscribedLabels": [
            "temperature",
            "humidity"
        ],
        "channels": [
            {
                "type": "EMAIL",
                "_class" : "org.edgexfoundry.support.domain.notifications.EmailChannel" ,
                "mailAddresses": [
                    "fred@abc.def",
                    "jeff@abc.def"
                ]
            }
        ]
    }
);

// Test case : Query subscriptions by matched categories

documents.push(
    {
        "slug": "group-g-member",
        "receiver": "Group G Member",
        "subscribedCategories": [
            "SW_HEALTH"
        ],
        "subscribedLabels": [
            "memory",
            "cpu"
        ],
        "channels": [
            {
                "type": "EMAIL",
                "_class" : "org.edgexfoundry.support.domain.notifications.EmailChannel" ,
                "mailAddresses": [
                    "gary@abc.def",
                    "grace@abc.def"
                ]
            }
        ]
    }
);

documents.push(
    {
        "slug": "group-h-member",
        "receiver": "Group H Member",
        "subscribedCategories": [
            "SW_HEALTH"
        ],
        "subscribedLabels": [
            "network"
        ],
        "channels": [
            {
                "type": "EMAIL",
                "_class" : "org.edgexfoundry.support.domain.notifications.EmailChannel" ,
                "mailAddresses": [
                    "howard@abc.def",
                    "henry@abc.def"
                ]
            }
        ]
    }
);

// Test case : Query subscriptions by matched labels

documents.push(
    {
        "slug": "group-i-member",
        "receiver": "Group I Member",
        "subscribedCategories": [
            "HW_HEALTH"
        ],
        "subscribedLabels": [
            "sensor",
            "cpu"
        ],
        "channels": [
            {
                "type": "EMAIL",
                "_class" : "org.edgexfoundry.support.domain.notifications.EmailChannel" ,
                "mailAddresses": [
                    "ava@abc.def",
                    "Allison@abc.def"
                ]
            }
        ]
    }
);

documents.push(
    {
        "slug": "group-j-member",
        "receiver": "Group J Member",
        "subscribedCategories": [
            "HW_HEALTH"
        ],
        "subscribedLabels": [
            "battery",
            "sensor"
        ],
        "channels": [
            {
                "type": "EMAIL",
                "_class" : "org.edgexfoundry.support.domain.notifications.EmailChannel" ,
                "mailAddresses": [
                    "joseph@abc.def"
                ]
            }
        ]
    }
);

// Test case : Query subscription by matched categories and labels

documents.push(
    {
        "slug": "group-k-member",
        "receiver": "Group K Member",
        "subscribedCategories": [
            "HW_HEALTH"
        ],
        "subscribedLabels": [
            "sensor",
            "cpu"
        ],
        "channels": [
            {
                "type": "EMAIL",
                "_class" : "org.edgexfoundry.support.domain.notifications.EmailChannel" ,
                "mailAddresses": [
                    "kevin@abc.def",
                    "karen@abc.def"
                ]
            }
        ]
    }
);

documents.push(
    {
        "slug": "group-l-member",
        "receiver": "Group L Member",
        "subscribedCategories": [
            "HW_HEALTH"
        ],
        "subscribedLabels": [
            "battery",
            "sensor"
        ],
        "channels": [
            {
                "type": "EMAIL",
                "_class" : "org.edgexfoundry.support.domain.notifications.EmailChannel" ,
                "mailAddresses": [
                    "lisa@abc.def"
                ]
            }
        ]
    }
);

// Test case : Query subscriptions by receiver name

documents.push(
    {
        "slug": "group-m-member-sw",
        "receiver": "Group M Member",
        "subscribedCategories": [
            "SW_HEALTH"
        ],
        "subscribedLabels": [
            "cpu",
            "memory"
        ],
        "channels": [
            {
                "type": "EMAIL",
                "_class" : "org.edgexfoundry.support.domain.notifications.EmailChannel" ,
                "mailAddresses": [
                    "lisa@abc.def"
                ]
            }
        ]
    }
);

documents.push(
    {
        "slug": "group-m-member-hw",
        "receiver": "Group M Member",
        "subscribedCategories": [
            "HW_HEALTH"
        ],
        "subscribedLabels": [
            "battery",
            "sensor"
        ],
        "channels": [
            {
                "type": "EMAIL",
                "_class" : "org.edgexfoundry.support.domain.notifications.EmailChannel" ,
                "mailAddresses": [
                    "lisa@abc.def"
                ]
            }
        ]
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

