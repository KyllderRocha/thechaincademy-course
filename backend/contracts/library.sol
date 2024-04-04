// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Math
 * @dev External library for mathematical operations.
 */
library Math {
    /**
     * @dev Function to calculate the power of a number.
     * @param base The base number.
     * @param exponent The exponent.
     * @return The result of base raised to the power of exponent.
     */
    function power(uint256 base, uint256 exponent) external pure returns (uint256) {
        uint256 result = 1;
        for (uint256 i = 0; i < exponent; i++) {
            result *= base;
        }
        return result;
    }
}

/**
 * @title Contract
 * @dev Contract that uses the Math library for power calculation.
 */
contract Contract {
    // Importing the Math library
    using Math for uint256;

    /**
     * @dev Function that uses the power function from the Math library.
     * @param base The base number.
     * @param exponent The exponent.
     * @return The result of base raised to the power of exponent.
     */
    function calculatePower(uint256 base, uint256 exponent) public pure returns (uint256) {
        return base.power(exponent);
    }
}
