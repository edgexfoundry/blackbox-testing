var commandsToBeRemoved = [
    ObjectId("57f4b917e4b060e2bff6c521"),
    ObjectId("57f73cece4b060e27309e458"),
    ObjectId("57f73d6ce4b060e27309e45a"),
    ObjectId("57f73d6ce4b060e27309e45e"),
    ObjectId("57f73d6ce4b060e27309e45b"),
    ObjectId("57fb3067e4b060e22bd8c1b6"),
    ObjectId("57f732a1e4b060e281141648"),
    ObjectId("57f7334ae4b060e281141649"),
    ObjectId("57f381cee4b060e268aeb058"),
    ObjectId("57f3769be4b060e268aeb055"),
    ObjectId("57f38597e4b060e268aeb05a"),
    ObjectId("57f385e1e4b060e268aeb05c"),
    ObjectId("57f38620e4b060e268aeb05e"),
    ObjectId("57f38682e4b060e268aeb060"),
    ObjectId("57f398e8e4b060e268aeb064"),
    ObjectId("57f39bafe4b060e268aeb066"),
    ObjectId("57f39c5ee4b060e268aeb06a"),
    ObjectId("57f39bf7e4b060e268aeb068"),
    ObjectId("57f39ee1e4b060e268aeb06c"),
    ObjectId("57f39efde4b060e268aeb06e"),
    ObjectId("57f39ff3e4b060e268aeb070"),
    ObjectId("57f47fd6e4b060e268aeb072"),
    ObjectId("57f48125e4b060e268aeb074"),
    ObjectId("57f48261e4b060e268aeb076"),
    ObjectId("57f496d0e4b060e268aeb07e"),
    ObjectId("57f492bae4b060e268aeb078"),
    ObjectId("57f4972be4b060e268aeb080"),
    ObjectId("57f492f6e4b060e268aeb07a"),
    ObjectId("57f4995be4b060e268aeb084"),
    ObjectId("57f4d26ae4b060e268aeb08c"),
    ObjectId("57f4d2a9e4b060e268aeb08e"),
    ObjectId("57f396c9e4b060e2071a5c2b"),
    ObjectId("57f396d4e4b060e2071a5c2c"),
    ObjectId("57f396f8e4b060e2071a5c2d"),
    ObjectId("57f3971fe4b060e2071a5c2e"),
    ObjectId("57f39773e4b060e2071a5c2f"),
    ObjectId("57f6320ee4b060e2e0dd6ecb"),
    ObjectId("57f63219e4b060e2e0dd6ecc"),
    ObjectId("57fdbcb3e4b060e2bbc15114"),
    ObjectId("57fe011ce4b060e2c823643a"),
    ObjectId("57fe0142e4b060e2c823643b"),
    ObjectId("57fddad1e4b060e2df0aa103"),
    ObjectId("57fdc221e4b060e2bbc1511b")
];

db.command.remove({
    _id: {
        $in: commandsToBeRemoved
    }
});
db.command.remove({'name': "coolingpoint"});
db.command.remove({'name': "cooling point"});
//db.command.remove({'device':"57e8b705e4b060e251231c4f"});
