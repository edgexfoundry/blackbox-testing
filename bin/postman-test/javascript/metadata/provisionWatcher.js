var provisionWatchersToBeRemoved = [
    ObjectId("57f4b954e4b060e2bff6c526"),
    ObjectId("57f4b954e4b060e2bff6c527"),
    ObjectId("57f4b954e4b060e2bff6c528")
];

db.provisionWatcher.remove({
    _id: {
        $in: provisionWatchersToBeRemoved
    }
});
db.provisionWatcher.remove({'name': "bacnet2 watcher"});
//db.provisionWatcher.remove({'device':"57e8b705e4b060e251231c4f"});