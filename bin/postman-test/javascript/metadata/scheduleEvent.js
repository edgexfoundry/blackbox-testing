var scheduleEventsToBeRemoved = [
    ObjectId("57f72b79e4b060e27309e453"),
    ObjectId("57f73d89e4b060e27309e45d"),
    ObjectId("57f73d89e4b060e27309e45c"),
    ObjectId("57f73d89e4b060e27309e45b"),
    ObjectId("57f73d89e4b060e27309e45f"),
    ObjectId("57f73d89e4b060e27309e46f"),
    ObjectId("57f7346ee4b060e28114164d"),
    ObjectId("57f737d7e4b060e28114164f")
];

db.scheduleEvent.remove({
    _id: {
        $in: scheduleEventsToBeRemoved
    }
});
db.scheduleEvent.remove({'name': "variable speed motor collection"});
//db.scheduleEvent.remove({'device':"57e8b705e4b060e251231c4f"});