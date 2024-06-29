// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
contract Maths{
    uint public add;
    uint public subtract;

    function Add(uint a , uint b) public returns (uint){
        uint result = a + b;
        add = result;
        return result;
    }
    function Subtract(uint a , uint b) public returns (uint){
        uint result = a - b;
        subtract = result;
        return result;
    }
    function tempAdd(uint a , uint b) public pure returns (uint){
        uint result = a + b;
        return result;
    }
    function tempSubtract(uint a , uint b) public pure returns (uint){
        uint result = a - b;
        return result;
    }
}