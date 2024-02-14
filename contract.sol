// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    // Variáveis de estado

    //Número inteiro.
    uint256 public myUint;
    //Endereço Ethereum.
    address public myAddress;
    //String
    string public myString;
    //Booleano
    bool public myBool;
    //Valor de 32 bytes
    bytes32 public myBytes32;

    // Variável de estado privada

    // Proprietário do contrato
    address private owner;

    // Modificador
    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    
    // Modificador
    modifier onlyPositiveValues (uint256 value) {
        require(value > 0, "Only Positive Values in this function");
        _;
    }

    // Construtor
    constructor() {
        owner = msg.sender;
        myUint = 123;
        myAddress = msg.sender;
        myString = "Hello, world!";
        myBool = true;
        myBytes32 = keccak256(abi.encodePacked("solidity"));
    }

    // Função pública para atualizar myUint
    function setMyUint(uint256 newValue) public onlyOwner onlyPositiveValues(newValue) {
        myUint = newValue;
    }

    // Função pública para atualizar myString
    function setMyString(string memory newValue) public onlyOwner {
        myString = newValue;
    }

    // Função pública para retornar o valor de myUint
    function getMyUint() public view returns (uint256) {
        return myUint;
    }
}
