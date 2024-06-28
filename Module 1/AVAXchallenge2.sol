// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Contract {
    uint internal Value;

    // function that reads the state variable
    function getValue() public view returns (uint) {
        return Value;
    }

    // function that performs a simple computation without reading state
    function addValues(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    // function that allows the contract to receive ether and set Value
    function storeValue(uint newValue) public payable {
        Value = newValue;
    }
}

// Derived contract to show accessibility
contract DerivedContract is Contract {
    // Derived contract can access view, pure, and payable functions from the base contract
    function setValue(uint newValue) public payable {
        storeValue(newValue);
    }

    function getValueDerived() public view returns (uint) {
        return getValue();
    }

    function addValuesDerived(uint a, uint b) public pure returns (uint) {
        return addValues(a, b);
    }
}
