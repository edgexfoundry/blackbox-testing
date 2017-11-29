var commandsToBeRemoved = [
    ObjectId("57fef1d5e4b060e2364c2e2f"),
    ObjectId("57fef1dbe4b060e2364c2e30"),
    ObjectId("57fb3067e4b060e22bd8c1b6"),
    ObjectId("57f73d6ce4b060e27309e45b"),
    ObjectId("57f5e077e4b060e2071a5c36"),
    ObjectId("57fef1fbe4b060e2364c2e30")
];

db.command.remove({
    _id: {
        $in: commandsToBeRemoved
    }
});