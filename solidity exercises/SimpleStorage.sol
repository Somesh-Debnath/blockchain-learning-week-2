// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract SimpleStorage {
    // State variable to store the number
    uint256 public storedNumber;

    // Function to set the stored number
    function setNumber(uint256 _number) public {
        storedNumber = _number;
    }

    // Function to get the stored number
    function getNumber() public view returns (uint256) {
        return storedNumber;
    }
}
