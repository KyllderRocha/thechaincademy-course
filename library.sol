// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Declaração da biblioteca externa
library MathLibrary {
    // Função para calcular a potência de um número
    function power(uint256 base, uint256 exponent) external pure returns (uint256) {
        uint256 result = 1;
        for (uint256 i = 0; i < exponent; i++) {
            result *= base;
        }
        return result;
    }
}

// Contrato que utiliza a biblioteca externa
contract MyContract {
    // Importação da biblioteca externa
    using MathLibrary for uint256;

    // Função que utiliza a função power da biblioteca externa
    function calculatePower(uint256 base, uint256 exponent) public pure returns (uint256) {
        return base.power(exponent);
    }
}
