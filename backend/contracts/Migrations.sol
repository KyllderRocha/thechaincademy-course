// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

/**
 * @title Migrations
 * @dev Smart contract used by Truffle for managing and updating migrations.
 */
contract Migrations {
    address public owner;
    uint public last_completed_migration;

    /**
     * @dev Modifier to restrict access to certain functions to the owner of the contract.
     */
    modifier restricted() {
        if (msg.sender == owner) _;
    }

    /**
     * @dev Constructor to set the owner of the contract.
     */
    constructor() {
        owner = msg.sender;
    }

    /**
     * @dev Function to set the last completed migration.
     * @param completed The index of the last completed migration.
     */
    function setCompleted(uint completed) public restricted {
        last_completed_migration = completed;
    }

    /**
     * @dev Function to upgrade the contract to a new address.
     * @param new_address The address of the new contract.
     */
    function upgrade(address new_address) public restricted {
        Migrations upgraded = Migrations(new_address);
        upgraded.setCompleted(last_completed_migration);
    }
}
