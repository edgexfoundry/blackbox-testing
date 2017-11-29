var deviceReportsToBeRemoved = [
    ObjectId("57f73d96e4b060e27309e45e"),
    ObjectId("57f73d96e4b060e27309e45d"),
    ObjectId("57f73d96e4b060e27309e45c"),
    ObjectId("57f73d96e4b060e27309e45a"),
    ObjectId("57f73788e4b060e28114164e"),
    ObjectId("57f73a50e4b060e281141651"),
    ObjectId("57f746b0e4b060e281141656"),
    ObjectId("57f7479ee4b060e281141658"),
    ObjectId("57f74b96e4b060e28114165c"),
    ObjectId("57f74bede4b060e28114165d")
];

db.deviceReport.remove({
    _id: {
        $in: deviceReportsToBeRemoved
    }
});
db.deviceReport.remove({'name': "livingroom collection report"});
//db.deviceReport.remove({'device':"57e8b705e4b060e251231c4f"});