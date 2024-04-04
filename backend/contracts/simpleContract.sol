// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title SimpleContract
 * @dev Smart contract with basic data types and access control.
 */
contract SimpleContract {
    // State variables

    // Unsigned integer.
    uint256 public myUint;
    // Ethereum address.
    address public myAddress;
    // String.
    string public myString;
    // Boolean.
    bool public myBool;
    // Bytes32 value.
    bytes32 public myBytes32;

    // Private state variable

    // Contract owner
    address private owner;

    // Errors
    error UnauthorizedAccess(address caller, address owner);

    // Modifier
    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // Modifier
    modifier onlyPositiveValues(uint256 value) {
        require(value > 0, "Only positive values allowed in this function");
        _;
    }

    // Constructor
    constructor() {
        owner = msg.sender; // Set the contract owner to the deployer
        myUint = 123; // Initialize myUint with a default value
        myAddress = msg.sender; // Initialize myAddress with the deployer's address
        myString = "Hello, world!"; // Initialize myString with a default value
        myBool = true; // Initialize myBool with a default value
        myBytes32 = keccak256(abi.encodePacked("solidity")); // Initialize myBytes32 with a hash value
    }

    /**
     * @dev Public function to update myUint
     * @param newValue The new value to set for myUint
     */
    function setMyUint(uint256 newValue) public onlyOwner onlyPositiveValues(newValue) {
        myUint = newValue; // Update myUint with the new value
    }

    /**
     * @dev Public function to set the value of myUint
     * @param newValue The value to set for myUint
     */
    function setValue(uint256 newValue) public {
        myUint = newValue; // Set the value of myUint
    }

    /**
     * @dev Public function to get the value of myUint
     * @return The value of myUint
     */
    function getValue() public view returns (uint256) {
        return myUint; // Return the value of myUint
    }

    /**
     * @dev Public function to update myString
     * @param newValue The new value to set for myString
     */
    function setMyString(string memory newValue) public onlyOwner {
        myString = newValue; // Update myString with the new value
    }

    /**
     * @dev Public function to get the value of myUint
     * @return The value of myUint
     */
    function getMyUint() public view returns (uint256) {
        return myUint; // Return the value of myUint
    }
}
