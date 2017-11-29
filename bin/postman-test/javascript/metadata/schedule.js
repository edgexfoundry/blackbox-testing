var schedulesToBeRemoved = [
    ObjectId("57f4b954e4b060e2bff6c526"),
    ObjectId("57f4b954e4b060e2bff6c527"),
    ObjectId("57f4b954e4b060e2bff6c528"),
    ObjectId("57f6224de4b060e231e2e9ae"),
    ObjectId("57f6224fe4b060e231e2e9af"),
    ObjectId("57f62253e4b060e231e2e9b0"),
    ObjectId("57fe00dae4b060e2c8236437"),
    ObjectId("57fe00eae4b060e2c8236438"),
    ObjectId("57fe00fae4b060e2c8236439"),
    ObjectId("57f49350e4b060e2bff6c51e"),
    ObjectId("57f49350e4b060e2bff6c52d"),
    ObjectId("57f73cd8e4b060e27309e457"),
    ObjectId("57f73cd8e4b060e27309e458"),
    ObjectId("57f73cd8e4b060e27309e452"),
    ObjectId("57f73242e4b060e281141647"),
    ObjectId("57f73cd8e4b060e27309e453"),
    ObjectId("57f49350e4b060e2bff6c51f"),
    ObjectId("57f49350e4b060e2bff6c52c")

];

db.schedule.remove({
    _id: {
        $in: schedulesToBeRemoved
    }
});
db.schedule.remove({'name': "at midnight4"});
//db.schedule.remove({'device':"57e8b705e4b060e251231c4f"});
