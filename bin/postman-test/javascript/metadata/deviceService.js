var deviceServicesToBeRemoved = [
    ObjectId("57f4b927e4b060e2bff6c525"),
    ObjectId("57f73d4ee4b060e27309e459"),
    ObjectId("57f73d4ee4b060e27309e460"),
    ObjectId("57f73d4ee4b060e27309e46e"),
    ObjectId("57f798efe4b060e2730a58f8"),
    ObjectId("57f79ca1e4b060e2730a58fc"),
    ObjectId("57f79a52e4b060e2730a58fb"),
    ObjectId("57f798e3e4b060e2730a58f7"),
    ObjectId("57f798f3e4b060e2730a58f9"),
    ObjectId("57f7990ce4b060e2730a58fa"),
    ObjectId("57f79ff6e4b060e22bd8c1a8"),
    ObjectId("57f7a15ae4b060e22bd8c1aa"),
    ObjectId("57fb23e1e4b060e22bd8c1ad"),
    ObjectId("57f733b1e4b060e28114164b"),
    ObjectId("57f35502e4b060e27b9d5f6b"),
    ObjectId("57f5df95e4b060e2071a5c35"),
    ObjectId("57fe0296e4b060e2c823643d"),
    ObjectId("57f6322de4b060e2e0dd6ece"),
    ObjectId("57fddb0de4b060e2df0aa105")
];

db.deviceService.remove({
    _id: {
        $in: deviceServicesToBeRemoved
    }
});
db.deviceService.remove({'name': "home thermostat device service1"});
//db.deviceService.remove({'device':"57e8b705e4b060e251231c4f"});
