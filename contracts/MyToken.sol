pragma solidity^0.4.18;

contract MyToken {
    
    mapping(address=> uint) balances;
    uint totalSupply;
    address centralBank;
    mapping(address => string) names;
    
    
    function MyToken(uint circulatingSupply) {
        centralBank = msg.sender;
        totalSupply = circulatingSupply;
        balances[centralBank] = circulatingSupply;
    }
    
    function checkBalance(address _address) constant returns (uint) {
        return balances[_address];
    }
    
    function sendTokens(address to, uint amount) public {
        address sender = msg.sender;
        balances[sender] = balances[sender] - amount;
        balances[to] += amount;
    }
    
    modifier hasFunds(address to, uint amt) {
        if (balances[to] >= amt) {
            _;
        } else {
            throw;
        }
    }
    
    modifier fundsAreLoanable(uint amt) {
        if (balances[centralBank] >= amt) {
            _;
        } else {
            throw;
        }
    }
    
    function requestFromMint(uint amount) fundsAreLoanable(amount) public {
        balances[msg.sender] += amount;
        balances[centralBank] -= amount;
    }
    
    function getCentralBankBalance() constant returns (uint) {
        return balances[centralBank];
    }
    
}