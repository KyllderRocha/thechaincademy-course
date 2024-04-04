const CRUDContract = artifacts.require("CRUDContract");
const SimpleContract = artifacts.require("SimpleContract");
const Migrations = artifacts.require("Migrations");

module.exports = function(deployer) {
    deployer.deploy(CRUDContract);
    deployer.deploy(SimpleContract);
    deployer.deploy(Migrations);
};