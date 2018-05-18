var deviceProfilesToBeRemoved = [
    ObjectId("57f4b917e4b060e2bff6c523"),
    ObjectId("57f73d6ce4b060e27309e45b"),
    ObjectId("57f73d6ce4b060e27309e46a"),
    ObjectId("57f73d6ce4b060e27309e46b"),
    ObjectId("57fb3067e4b060e22bd8c1b7"),
    ObjectId("57f7334be4b060e28114164a"),
    ObjectId("57f38597e4b060e268aeb05b"),
    ObjectId("57f381cee4b060e268aeb059"),
    ObjectId("57f398e8e4b060e268aeb065"),
    ObjectId("57f39ee1e4b060e268aeb06d"),
    ObjectId("57f39efde4b060e268aeb06f"),
    ObjectId("57f492f6e4b060e268aeb07b"),
    ObjectId("57f3769be4b060e268aeb056"),
    ObjectId("57f4995be4b060e268aeb085"),
    ObjectId("57f47fd6e4b060e268aeb073"),
    ObjectId("57f4d26ae4b060e268aeb08d"),
    ObjectId("57f4d2a9e4b060e268aeb08f"),
    ObjectId("57f5e077e4b060e2071a5c37"),
    ObjectId("57fe0142e4b060e2c823643c"),
    ObjectId("57fdc221e4b060e2bbc1511c"),
    ObjectId("57fddad1e4b060e2df0aa104"),
    ObjectId("57fb3067e4b060e22bd8c1b6"),
    ObjectId("57f5e077e4b060e2071a5c36")
];

db.deviceProfile.remove({
    _id: {
        $in: deviceProfilesToBeRemoved
    }
});
db.deviceProfile.remove({'name': "TestProfileToPost"});
db.deviceProfile.remove({'name': "TestProfileToPostUniqe"});
db.deviceProfile.remove({'name': "yaml thermostat profile"});
//db.deviceProfile.remove({'device':"57e8b705e4b060e251231c4f"});
