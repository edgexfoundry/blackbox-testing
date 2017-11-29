var deviceProfilesToBeRemoved = [
    ObjectId("57fef1dbe4b060e2364c2e31"),
    ObjectId("57fb3067e4b060e22bd8c1b7"),
    ObjectId("57f73d6ce4b060e27309e46b"),
    ObjectId("57f5e077e4b060e2071a5c37"),
    ObjectId("57fef1e6e4b060e2374f2e32")
];

db.deviceProfile.remove({
    _id: {
        $in: deviceProfilesToBeRemoved
    }
});
