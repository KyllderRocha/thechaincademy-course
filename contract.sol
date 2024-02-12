// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    // Variável de estado
    uint256 public myNumber;

    // Variável de estado privada
    address private owner;

    // Construtor do contrato
    constructor() {
        owner = msg.sender;
        myNumber = 0;
    }

    // Função pública para atualizar o número
    function setNumber(uint256 _newValue) public {
        myNumber = _newValue;
    }

    // Função pública que retorna o número
    function getNumber() public view returns (uint256) {
        return myNumber;
    }

    // Função interna que duplica o número
    function doubleNumber() internal {
        myNumber *= 2;
    }

    // Modificador de visibilidade
    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    // Função apenas para o proprietário
    function modifyNumber() public onlyOwner {
        doubleNumber();
    }

}
