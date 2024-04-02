const Migrations = artifacts.require("Migrations");

contract("Migrations", function(accounts) {
    it("should deploy the Migrations contract", async function() {
        const migrationsInstance = await Migrations.deployed();
        assert.ok(migrationsInstance.address, "Migrations contract was not deployed");
    });
});