// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Vehicle
 * @dev Base contract for a Vehicle.
 */
contract Vehicle {
    // State variables to store basic vehicle information
    string public make; // Vehicle make
    string public model; // Vehicle model
    uint256 public year; // Vehicle manufacturing year

    /**
     * @dev Constructor to initialize the Vehicle with the provided details.
     * @param _make The make of the vehicle.
     * @param _model The model of the vehicle.
     * @param _year The manufacturing year of the vehicle.
     */
    constructor(string memory _make, string memory _model, uint256 _year) {
        make = _make;
        model = _model;
        year = _year;
    }

    /**
     * @dev Function to get the details of the vehicle.
     * @return The make, model, and year of the vehicle.
     */
    function getDetails() public virtual view returns (string memory, string memory, uint256) {
        return (make, model, year);
    }
}

/**
 * @title Car
 * @dev Contract for a Car, inheriting from Vehicle.
 */
contract Car is Vehicle {
    // Additional state variable to store the number of doors of the car
    uint256 public numDoors; // Number of doors of the car

    /**
     * @dev Constructor to initialize the Car with the provided details.
     * @param _make The make of the car.
     * @param _model The model of the car.
     * @param _year The manufacturing year of the car.
     * @param _numDoors The number of doors of the car.
     */
    constructor(string memory _make, string memory _model, uint256 _year, uint256 _numDoors)
        Vehicle(_make, _model, _year)
    {
        numDoors = _numDoors;
    }
    
    /**
     * @dev Function to get the details of the car.
     * @return The make, model, and year of the car.
     */
    function getDetails() public view override returns (string memory, string memory, uint256) {
        return (make, model, year); // Returns the basic vehicle details
    }
}

/**
 * @title Motorcycle
 * @dev Contract for a Motorcycle, inheriting from Vehicle.
 */
contract Motorcycle is Vehicle {
    // Additional state variable to store the style of the motorcycle
    string public style; // Motorcycle style

    /**
     * @dev Constructor to initialize the Motorcycle with the provided details.
     * @param _make The make of the motorcycle.
     * @param _model The model of the motorcycle.
     * @param _year The manufacturing year of the motorcycle.
     * @param _style The style of the motorcycle.
     */
    constructor(string memory _make, string memory _model, uint256 _year, string memory _style)
        Vehicle(_make, _model, _year)
    {
        style = _style;
    }
    
    /**
     * @dev Function to get the details of the motorcycle.
     * @return The make, style, and year of the motorcycle.
     */
    function getDetails() public view override returns (string memory, string memory, uint256) {
        return (make, style, year); // Returns the details with motorcycle-specific style
    }
}
