var devicesToBeRemoved = [
    ObjectId("57f73d70e4b060e27309e45c"),
    ObjectId("57f73d70e4b060e27309e45d"),
    ObjectId("57f73d70e4b060e27309e45e"),
    ObjectId("57fb30d2e4b060e22bd8c1b8"),
    ObjectId("57f7343ae4b060e28114164c"),
    ObjectId("57f378bee4b060e268aeb057"),
    ObjectId("57f35577e4b060e27b9d5f6f"),
    ObjectId("57f5e0ebe4b060e2071a5c38"),
    ObjectId("57f5e11fe4b060e2071a5c39"),
    ObjectId("57f63243e4b060e2e0dd6ed0"),
    ObjectId("57fdbaeee4b060e2bbc15111"),
    ObjectId("57fdbc06e4b060e2bbc15113"),
    ObjectId("57fe0342e4b060e2c823643f"),
    ObjectId("57fddeefe4b060e2df0aa107"),
    ObjectId("57fddb6ee4b060e2df0aa106"),
    ObjectId("57fe0321e4b060e2df0aa10d")

];

db.device.remove({
    _id: {
        $in: devicesToBeRemoved
    }
});
db.device.remove({'name': "Home automation"});
db.device.remove({'name': "AWS IOT Button"});
//db.device.remove({'device':"57e8b705e4b060e251231c4f"});
