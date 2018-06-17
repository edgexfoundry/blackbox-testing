var dbName = 'notifications';
var collections = ['transmission' ,'notification' ,'subscription' ];
var operationStatus;

collections.forEach(function(collection) {
    operationStatus = db[collection].remove({});
    print('[mongo js script] DB: '+ dbName + ' , collecation: ' + collection + ' , flushed ' + operationStatus.nRemoved +' documents');

});

