// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {

    mapping(address => uint256) public balances;

    error InsufficientBalance(uint256 available, uint256 required);

    modifier SufficientBalance(uint256 amount) {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        _;
    }

    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Ownable: caller is not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    
    event Deposit(address indexed sender, uint256 amount);
    event Withdrawal(address indexed sender, uint256 amount);

    
    function deposit() external payable {
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external onlyOwner SufficientBalance(amount) {
        require(amount <= address(this).balance, "Insufficient contract balance");
        payable(msg.sender).transfer(amount);
        balances[msg.sender] -= amount;
        emit Withdrawal(msg.sender, amount);
    }

    function increaseBalance(uint256 amount) external onlyOwner {
        for (uint256 i = 0; i < amount; i++) {
            balances[msg.sender]++;
        }
    }

    function decreaseBalance(uint256 amount) external onlyOwner {
        uint256 i = 0;
        while (i < amount) {
            if (balances[msg.sender] > 0) {
                balances[msg.sender]--;
                i++;
            } else {
                revert("Balance cannot be negative");
            }
        }
    }
}