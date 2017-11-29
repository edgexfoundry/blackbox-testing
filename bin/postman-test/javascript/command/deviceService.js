var deviceServicesToBeRemoved = [
    ObjectId("57fef1e6e4b060e2364c2e32"),
    ObjectId("57f79ff6e4b060e22bd8c1a8"),
    ObjectId("57f73d4ee4b060e27309e46e"),
    ObjectId("57f5df95e4b060e2071a5c35"),
    ObjectId("57fef1e6e4b070e2374f2e32")
];

db.deviceService.remove({
    _id: {
        $in: deviceServicesToBeRemoved
    }
});
