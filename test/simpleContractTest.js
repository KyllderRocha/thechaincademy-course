// const SimpleContract = artifacts.require("SimpleContract");

// contract("SimpleContract", (accounts) => {
//     let simpleContract;
//     const owner = accounts[0];

//     beforeEach(async() => {
//         simpleContract = await SimpleContract.new({ from: owner });
//     });

//     it("should initialize contract state correctly", async() => {
//         const myUint = await simpleContract.myUint();
//         const myAddress = await simpleContract.myAddress();
//         const myString = await simpleContract.myString();
//         const myBool = await simpleContract.myBool();
//         const myBytes32 = await simpleContract.myBytes32();

//         assert.equal(myUint.toNumber(), 123, "myUint should be initialized to 123");
//         assert.equal(myAddress, owner, "myAddress should be initialized to contract deployer");
//         assert.equal(myString, "Hello, world!", "myString should be initialized to 'Hello, world!'");
//         assert.equal(myBool, true, "myBool should be initialized to true");
//         assert.equal(myBytes32, web3.utils.keccak256("solidity"), "myBytes32 should be initialized to the keccak256 hash of 'solidity'");
//     });

//     it("should set new value for myUint", async() => {
//         const newValue = 456;
//         await simpleContract.setMyUint(newValue, { from: owner });
//         const myUint = await simpleContract.myUint();

//         assert.equal(myUint.toNumber(), newValue, "myUint should be updated to the new value");
//     });

//     it("should revert when setting negative value for myUint", async() => {
//         const newValue = -123;
//         try {
//             await simpleContract.setMyUint(newValue, { from: owner });
//             assert.fail("Expected revert for setting negative value for myUint");
//         } catch (error) {
//             assert.include(error.message, "Only Positive Values", "Error message should indicate setting negative value is not allowed");
//         }
//     });

//     it("should set new value for myString", async() => {
//         const newValue = "New string";
//         await simpleContract.setMyString(newValue, { from: owner });
//         const myString = await simpleContract.myString();

//         assert.equal(myString, newValue, "myString should be updated to the new value");
//     });

//     it("should revert when setting new value for myString by non-owner", async() => {
//         const newValue = "New string";
//         try {
//             await simpleContract.setMyString(newValue, { from: accounts[1] });
//             assert.fail("Expected revert for setting new value for myString by non-owner");
//         } catch (error) {
//             assert.include(error.message, "UnauthorizedAccess", "Error message should indicate unauthorized access");
//         }
//     });

//     it("should return correct value for myUint", async() => {
//         const myUint = await simpleContract.getMyUint();
//         assert.equal(myUint.toNumber(), 123, "getMyUint should return correct value of myUint");
//     });
// });