var addressablesToBeRemoved = [
    ObjectId("57f37fd8e4b060e2bff6c517"),
    ObjectId("57f73cd2e4b060e27309e456"),
    ObjectId("57f73cd2e4b060e27309e457"),
    ObjectId("57f73cd2e4b060e27309e458"),
    ObjectId("57f75e9be4b060e2730a58e3"),
    ObjectId("57f62eb7e4b060e252ba5ed1"),
    ObjectId("57f75ea4e4b060e2730a58e4"),
    ObjectId("57f74398e4b060e2730a58de"),
    ObjectId("57f73226e4b060e281141646"),
    ObjectId("57f333cee4b060e27b9d5f5b"),
    ObjectId("57f333fae4b060e27b9d5f5c"),
    ObjectId("57f3342ce4b060e27b9d5f5d"),
    ObjectId("57f334d2e4b060e27b9d5f5e"),
    ObjectId("57f33505e4b060e27b9d5f5f"),
    ObjectId("57f335fce4b060e27b9d5f60"),
    ObjectId("57f33651e4b060e27b9d5f61"),
    ObjectId("57f33672e4b060e27b9d5f62"),
    ObjectId("57f5df3ce4b060e2071a5c34"),
    ObjectId("57f631f4e4b060e2e0dd6eca"),
    ObjectId("57f635dfe4b060e2e0dd6ed1"),
    ObjectId("57fdb862e4b060e2bbc1510e"),
    ObjectId("57fdbb53e4b060e2bbc15112"),
    ObjectId("57fe00b3e4b060e2c8236436")
];

db.addressable.remove({
    _id: {
        $in: addressablesToBeRemoved
    }
});
db.addressable.remove({'name': "variableSpeedMeter"});
db.addressable.remove({'name': "Nest Cam"});
//db.addressable.remove({'device':"57e8b705e4b060e251231c4f"});
