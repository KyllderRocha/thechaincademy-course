const CRUDContract = artifacts.require("CRUDContract");

contract("CRUDContract", (accounts) => {
    let crudContract;

    beforeEach(async() => {
        crudContract = await CRUDContract.new();
    });

    // Test case to ensure that a new item can be created successfully
    it("should create a new item", async() => {
        await crudContract.createItem("Item 1");
        const item = await crudContract.readItem(1);

        // Assertion to verify that the item ID and name match the expected values
        assert.equal(item.id, 1, "Item ID should match");
        assert.equal(item.name, "Item 1", "Item name should match");
    });

    // Test case to ensure that an existing item can be updated successfully
    it("should update an existing item", async() => {
        await crudContract.createItem("Item 1");
        await crudContract.updateItem(1, "Updated Item");
        const item = await crudContract.readItem(1);

        // Assertion to verify that the item name has been updated
        assert.equal(item.name, "Updated Item", "Item name should be updated");
    });

    // Test case to ensure that an existing item can be deleted successfully
    it("should delete an existing item", async() => {
        await crudContract.createItem("Item 1");
        await crudContract.deleteItem(1);
        try {
            const item = await crudContract.readItem(1);
        } catch (e) {
            // Assertion to verify that the correct error message is thrown when trying to read a deleted item
            assert(e.message.includes("Item not found"));
            return
        }
        assert(false) // Assertion to ensure that the test fails if the item is not deleted
    });

    // Test case to ensure that empty values are returned for a non-existent item
    it("should return empty values for non-existent item", async() => {
        try {
            const item = await crudContract.readItem(999);
        } catch (e) {
            // Assertion to verify that the correct error message is thrown when trying to read a non-existent item
            assert(e.message.includes("Item not found"));
            return
        }
        assert(false) // Assertion to ensure that the test fails if the item is found
    });
});