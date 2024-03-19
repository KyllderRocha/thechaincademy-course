const CRUDContract = artifacts.require("CRUDContract");

contract("CRUDContract", (accounts) => {
    let crudContract;

    beforeEach(async() => {
        crudContract = await CRUDContract.new();
    });

    it("should create a new item", async() => {
        await crudContract.createItem("Item 1");
        const item = await crudContract.readItem(1);

        assert.equal(item.id.toNumber(), 1, "Item ID should match");
        assert.equal(item.name, "Item 1", "Item name should match");
    });

    it("should update an existing item", async() => {
        await crudContract.createItem("Item 1");
        await crudContract.updateItem(1, "Updated Item");
        const item = await crudContract.readItem(1);

        assert.equal(item.name, "Updated Item", "Item name should be updated");
    });

    it("should delete an existing item", async() => {
        await crudContract.createItem("Item 1");
        await crudContract.deleteItem(1);
        const item = await crudContract.readItem(1);

        assert.equal(item.id.toNumber(), 0, "Item should be deleted");
    });

    it("should return empty values for non-existent item", async() => {
        const item = await crudContract.readItem(999);

        assert.equal(item.id.toNumber(), 0, "Item ID should be 0 for non-existent item");
        assert.equal(item.name, "", "Item name should be empty for non-existent item");
    });
});