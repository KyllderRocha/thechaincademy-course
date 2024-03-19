// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CRUDContract {
    struct Item {
        uint id;
        string name;
    }

    Item[] public items;
    uint public nextId = 1;

    event ItemCreated(uint id, string name);
    event ItemUpdated(uint id, string newName);
    event ItemDeleted(uint id);

    function createItem(string memory _name) public {
        items.push(Item(nextId, _name));
        emit ItemCreated(nextId, _name);
        nextId++;
    }

    function readItem(uint _id) public view returns (uint, string memory) {
        for (uint i = 0; i < items.length; i++) {
            if (items[i].id == _id) {
                return (items[i].id, items[i].name);
            }
        }
        revert("Item not found");
    }

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
