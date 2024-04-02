const CRUDContract = artifacts.require("CRUDContract");

contract("CRUDContract", (accounts) => {
    let crudContract;

    beforeEach(async() => {
        crudContract = await CRUDContract.new();
    });

    it("should create a new item", async() => {
        await crudContract.createItem("Item 1");
        const item = await crudContract.readItem(1);

        assert.equal(item.id, 1, "Item ID should match");
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
        try {
            const item = await crudContract.readItem(1);
        } catch (e) {
            assert(e.message.includes("Item not found"));
            return
        }
        assert(false)

    });

    it("should return empty values for non-existent item", async() => {
        try {
            const item = await crudContract.readItem(999);
        } catch (e) {
            assert(e.message.includes("Item not found"));
            return
        }
        assert(false)
    });
});