var devicesToBeRemoved = [
    ObjectId("57fef1f9e4b060e2364c2e33"),
    ObjectId("57fb30d2e4b060e22bd8c1b8"),
    ObjectId("57f73d70e4b060e27309e45e"),
    ObjectId("57f5e0ebe4b060e2071a5c38"),
    ObjectId("57f5e11fe4b060e2071a5c39"),
    ObjectId("57f7937ae4b060e2d67c20b5")
];

db.device.remove({
    _id: {
        $in: devicesToBeRemoved
    }
});
