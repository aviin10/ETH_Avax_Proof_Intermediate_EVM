// SPDX-License-Identifier: MIT
pragma solidity >=0.8.7;

contract Math {
    uint256 private Number;
    // A function to set a number, not a view or pure function since it changes the state
    function setNumber(uint256 _number) public {
        Number = _number;
    }
    // A view function to get the stored number, does not modify the state
    function getNumber() public view returns (uint256) {
        return Number;
    }
    // A pure function to add two numbers, does not read or modify the state
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }
    function subtract(uint256 a, uint256 b) public pure returns (uint256) {
        return a - b;
    }
    function multiply(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }
    function divide(uint256 a, uint256 b) public pure returns (uint256) {
        require(b != 0, "Division by zero is not Possible.");
        return a / b;
    }
}