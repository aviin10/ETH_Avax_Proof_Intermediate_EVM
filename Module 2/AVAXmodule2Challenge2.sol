// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
contract Proxy {
    address public owner;
    address public admin;
    constructor(address _owner) {
        owner = _owner;
        admin = msg.sender;
    }
    modifier AdminOnly {
        require(msg.sender == admin, "Only admin can call !!");
        _;
    }
    function upgrade(address _newowner) external AdminOnly {
        owner = _newowner;
    }
    fallback() external payable {
        require(owner != address(0), "Owner address to be set !!");
        (bool success, ) = owner.delegatecall(abi.encodePacked(msg.data)); 
        require(success, "Delegatecall hsa failed !!");
    }
    receive() external payable {
        revert("Fallback function is not payable right now !!");
    }
}

contract Counter {
    uint public count;
    function increment() external {
        count += 1;
    }
    function getCount() external view returns (uint) {
        return count;
    }
}