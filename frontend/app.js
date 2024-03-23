// Conexão com o contrato inteligente
const contractAddress = document.getElementById('contractAddress').value;
const contractABI = [
    // Definir o ABI do seu contrato aqui
];


var xmlhttp = new XMLHttpRequest();
xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        contractABI = JSON.parse(this.responseText).abi;
    }
};

xmlhttp.open("GET", "../build/contracts/SimpleContract.json", true);
xmlhttp.send();



const provider = new ethers.providers.JsonRpcProvider("http://localhost:8545"); // Defina a URL do seu provedor
const contract = new ethers.Contract(contractAddress, contractABI, provider);

// Escutar alterações no campo de entrada contractAddress
document.getElementById('contractAddress').addEventListener('input', function() {
    contractAddress = this.value;
});

// Função para ler o valor do contrato inteligente
async function readValue() {
    try {
        const value = await contract.getValue();
        document.getElementById('output').innerHTML = `Value: ${value.toString()}`;
    } catch (error) {
        document.getElementById('output').innerHTML = `Error: ${error.message}`;
    }
}

// Função para definir o valor do contrato inteligente
async function setValue() {
    const newValue = Math.floor(Math.random() * 100); // Exemplo de novo valor (aleatório)
    try {
        const tx = await contract.setValue(newValue);
        await tx.wait();
        document.getElementById('output').innerHTML = `Value set to: ${newValue}`;
    } catch (error) {
        document.getElementById('output').innerHTML = `Error: ${error.message}`;
    }
}