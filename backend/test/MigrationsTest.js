const Migrations = artifacts.require("Migrations");

contract("Migrations", function(accounts) {
    // Test case to ensure that the Migrations contract is deployed successfully
    it("should deploy the Migrations contract", async function() {
        const migrationsInstance = await Migrations.deployed();
        // Assertion to verify that the address of the deployed contract is not empty
        assert.ok(migrationsInstance.address, "Migrations contract was not deployed");
    });
});