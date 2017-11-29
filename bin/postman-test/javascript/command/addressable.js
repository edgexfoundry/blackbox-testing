var addressablesToBeRemoved = [
    ObjectId("57fef1cce4b060e2364c2e2d"),
    ObjectId("57f74398e4b060e2730a58de"),
    ObjectId("57f73cd2e4b060e27309e458"),
    ObjectId("57f5df3ce4b060e2071a5c34"),
    ObjectId("57fef1cce4b060e2364c2e3d")
];

db.addressable.remove({
    _id: {
        $in: addressablesToBeRemoved
    }
});
