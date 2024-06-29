// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
contract Ether {
    address public owner;
    event Receive(address sender, uint256 amount);
    event Withdraw(address to, uint256 amount);

    modifier OwnerOnly() {
        require(msg.sender == owner, "Not the owner.");
        _;
    }
    constructor() {
        owner = msg.sender;
    }
    // Fallback function to handle unrecognized calls and receive Ether
    fallback() external payable {
        emit Receive(msg.sender, msg.value);
    }
    // Function to receive Ether
    receive() external payable {
        emit Receive(msg.sender, msg.value);
    }
    // Function to withdraw Ether from the contract
    function withdraw(uint256 _amount) public OwnerOnly {
        require(address(this).balance >= _amount, "Insufficient balance");
        payable(owner).transfer(_amount);
        emit Withdraw(owner, _amount);
    }
    // Function to check the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}