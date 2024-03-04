// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Contrato base para um Veículo
contract Vehicle {
    // Variáveis de estado para armazenar informações básicas do veículo
    string public make; // Marca do veículo
    string public model; // Modelo do veículo
    uint256 public year; // Ano de fabricação do veículo


    constructor(string memory _make, string memory _model, uint256 _year) {
        make = _make;
        model = _model;
        year = _year;
    }

    // Função para obter os detalhes do veículo
    function getDetails() public virtual view returns (string memory, string memory, uint256) {
        return (make, model, year);
    }
}

// Contrato para Carro, que herda de Vehicle
contract Car is Vehicle {
    // Variável de estado adicional para armazenar o número de portas do carro
    uint256 public numDoors; // Número de portas do carro

    constructor(string memory _make, string memory _model, uint256 _year, uint256 _numDoors)
        Vehicle(_make, _model, _year)
    {
        numDoors = _numDoors;
    }
    
    // Função para obter os detalhes do carro
    function getDetails() public view override returns (string memory, string memory, uint256) {
        return (make, model, year); // Retorna os detalhes básicos do veículo
    }
}

// Contrato para Moto, que herda de Vehicle
contract Motorcycle is Vehicle {
    // Variável de estado adicional para armazenar o estilo da moto
    string public style; // Estilo da moto

    constructor(string memory _make, string memory _model, uint256 _year, string memory _style)
        Vehicle(_make, _model, _year)
    {
        style = _style;
    }
    
    // Função para obter os detalhes da moto
    function getDetails() public view override returns (string memory, string memory, uint256) {
        return (make, style, year); // Retorna os detalhes com estilo específico da moto
    }
}