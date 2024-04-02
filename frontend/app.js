// // Conexão com o contrato inteligente
// const contractAddress = document.getElementById('contractAddress').value;
// const contractABI = [
//     // Definir o ABI do seu contrato aqui
// ];


// var xmlhttp = new XMLHttpRequest();
// xmlhttp.onreadystatechange = function() {
//     if (this.readyState == 4 && this.status == 200) {
//         contractABI = JSON.parse(this.responseText).abi;
//     }
// };

// xmlhttp.open("GET", "../build/contracts/SimpleContract.json", true);
// xmlhttp.send();



// const provider = new ethers.providers.JsonRpcProvider("http://localhost:8545"); // Defina a URL do seu provedor
// const contract = new ethers.Contract(contractAddress, contractABI, provider);

// // Escutar alterações no campo de entrada contractAddress
// document.getElementById('contractAddress').addEventListener('input', function() {
//     contractAddress = this.value;
// });

// // Função para ler o valor do contrato inteligente
// async function readValue() {
//     try {
//         const value = await contract.getValue();
//         document.getElementById('output').innerHTML = `Value: ${value.toString()}`;
//     } catch (error) {
//         document.getElementById('output').innerHTML = `Error: ${error.message}`;
//     }
// }

// // Função para definir o valor do contrato inteligente
// async function setValue() {
//     const newValue = Math.floor(Math.random() * 100); // Exemplo de novo valor (aleatório)
//     try {
//         const tx = await contract.setValue(newValue);
//         await tx.wait();
//         document.getElementById('output').innerHTML = `Value set to: ${newValue}`;
//     } catch (error) {
//         document.getElementById('output').innerHTML = `Error: ${error.message}`;
//     }
// }




//1- connect metamask
let account;
const connectMetamask = async() => {
    if (window.ethereum !== "undefined") {
        const accounts = await ethereum.request({ method: "eth_requestAccounts" });
        account = accounts[0];
        document.getElementById("accountArea").innerHTML = account;
    }
}

//2- connect to smart contract
const connectContract = async() => {
    const ABI = [

        {
            "anonymous": false,
            "inputs": [{
                    "indexed": false,
                    "internalType": "uint256",
                    "name": "id",
                    "type": "uint256"
                },
                {
                    "indexed": false,
                    "internalType": "string",
                    "name": "name",
                    "type": "string"
                }
            ],
            "name": "ItemCreated",
            "type": "event"
        },
        {
            "anonymous": false,
            "inputs": [{
                "indexed": false,
                "internalType": "uint256",
                "name": "id",
                "type": "uint256"
            }],
            "name": "ItemDeleted",
            "type": "event"
        },
        {
            "anonymous": false,
            "inputs": [{
                    "indexed": false,
                    "internalType": "uint256",
                    "name": "id",
                    "type": "uint256"
                },
                {
                    "indexed": false,
                    "internalType": "string",
                    "name": "newName",
                    "type": "string"
                }
            ],
            "name": "ItemUpdated",
            "type": "event"
        },
        {
            "inputs": [{
                "internalType": "uint256",
                "name": "",
                "type": "uint256"
            }],
            "name": "items",
            "outputs": [{
                    "internalType": "uint256",
                    "name": "id",
                    "type": "uint256"
                },
                {
                    "internalType": "string",
                    "name": "name",
                    "type": "string"
                }
            ],
            "stateMutability": "view",
            "type": "function"
        },
        {
            "inputs": [],
            "name": "nextId",
            "outputs": [{
                "internalType": "uint256",
                "name": "",
                "type": "uint256"
            }],
            "stateMutability": "view",
            "type": "function"
        },
        {
            "inputs": [{
                "internalType": "string",
                "name": "_name",
                "type": "string"
            }],
            "name": "createItem",
            "outputs": [],
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "inputs": [{
                "internalType": "uint256",
                "name": "_id",
                "type": "uint256"
            }],
            "name": "readItem",
            "outputs": [{
                "components": [{
                        "internalType": "uint256",
                        "name": "id",
                        "type": "uint256"
                    },
                    {
                        "internalType": "string",
                        "name": "name",
                        "type": "string"
                    }
                ],
                "internalType": "struct CRUDContract.Item",
                "name": "",
                "type": "tuple"
            }],
            "stateMutability": "view",
            "type": "function"
        },
        {
            "inputs": [{
                    "internalType": "uint256",
                    "name": "_id",
                    "type": "uint256"
                },
                {
                    "internalType": "string",
                    "name": "_newName",
                    "type": "string"
                }
            ],
            "name": "updateItem",
            "outputs": [],
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "inputs": [{
                "internalType": "uint256",
                "name": "_id",
                "type": "uint256"
            }],
            "name": "deleteItem",
            "outputs": [],
            "stateMutability": "nonpayable",
            "type": "function"
        }
    ];
    const Address = "0x1DCabB8360c16728f0ce5e41BF58ec5eA1a5bA45";
    window.web3 = await new Web3(window.ethereum);
    window.contract = await new window.web3.eth.Contract(ABI, Address);
    document.getElementById("contractArea").innerHTML = "connected to smart contract";
}

//3-read data from smart contract
const readContract = async() => {
    const data = await window.contract.methods.myCity().call();
    document.getElementById("dataArea").innerHTML = data;
}