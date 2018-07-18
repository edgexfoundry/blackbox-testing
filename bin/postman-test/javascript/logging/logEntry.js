var logEntryToBeRemoved = [
    ObjectId("1b10147fd6bb6b2d6a48de10"),
    ObjectId("1b10147fd7bb6b2d6a48dee1"),
    ObjectId("2b10147fd7bb6b2d6a48dee2"),
    ObjectId("3b10147fd7bb6b2d6a48dee3"),
    ObjectId("4b10147fd7bb6b2d6a48dee4"),
    ObjectId("5b10147fd7bb6b2d6a48dee5"),
    ObjectId("6b10147fd7bb6b2d6a48dee6"),
    ObjectId("7b10147fd7bb6b2d6a48dee7")
];

db.logEntry.remove({
    _id: {
        $in: logEntryToBeRemoved
    }
});

db.logEntry.remove({"originService" : "testService"});