// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title CRUDContract
 * @dev A simple CRUD (Create, Read, Update, Delete) contract for managing items.
 */
contract CRUDContract {
    // Struct to represent an item
    struct Item {
        uint id;    // Unique identifier for the item
        string name;    // Name of the item
    }

    // Array to store all items
    Item[] public items;

    // Counter for generating unique IDs for new items
    uint public nextId = 1;

    // Events emitted for various CRUD operations
    event ItemCreated(uint id, string name);
    event ItemUpdated(uint id, string newName);
    event ItemDeleted(uint id);

    /**
     * @dev Creates a new item with the given name.
     * @param _name The name of the item to create.
     */
    function createItem(string memory _name) public {
        items.push(Item(nextId, _name));
        emit ItemCreated(nextId, _name);
        nextId++;
    }

    /**
     * @dev Retrieves the details of an item by its ID.
     * @param _id The ID of the item to read.
     * @return The details of the item (ID and name).
     */
    function readItem(uint _id) public view returns (Item memory) {
        for (uint i = 0; i < items.length; i++) {
            if (items[i].id == _id) {
                return items[i];
            }
        }
        revert("Item not found");
    }

    /**
     * @dev Updates the name of an existing item.
     * @param _id The ID of the item to update.
     * @param _newName The new name for the item.
     */
    function updateItem(uint _id, string memory _newName) public {
        for (uint i = 0; i < items.length; i++) {
            if (items[i].id == _id) {
                items[i].name = _newName;
                emit ItemUpdated(_id, _newName);
                return;
            }
        }
        revert("Item not found");
    }

    /**
     * @dev Deletes an existing item by its ID.
     * @param _id The ID of the item to delete.
     */
    function deleteItem(uint _id) public {
        for (uint i = 0; i < items.length; i++) {
            if (items[i].id == _id) {
                emit ItemDeleted(_id);
                delete items[i];
                return;
            }
        }
        revert("Item not found");
    }
}
