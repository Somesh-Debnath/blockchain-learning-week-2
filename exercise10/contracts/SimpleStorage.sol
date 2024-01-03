
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

// SimpleStorage contract to store and retrieve a uint256 balance
contract SimpleStorage {
    // State variable to store the balance
    uint256 balance;

    // Constructor to initialize the contract with an initial balance
    constructor(uint256 initialBalance) {
        balance = initialBalance;
    }

    // Function to retrieve the current balance
    function getBalance() public view returns (uint256) {
        // Return the current balance without modifying the state
        return balance;
    }

    // Function to set a new balance
    function setBalance(uint256 num) public {
        // Update the balance with the provided value
        balance = num;
    }
}