// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Global {
    function getContractBalance() public view returns(uint256) {
        return address(this).balance;
    }

    function transferFunds(address payable recipient, uint256 amount) public {
        recipient.transfer(amount);
    }

    function sendFunds(address payable recipient, uint256 amount) public returns(bool) {
        return recipient.send(amount);
    }

    function depositEther() external payable {
    }

    function getCallerAddress() public view returns (address) {
        return msg.sender;
    }

    function getRemainingGas() public view returns (uint256) {
        return gasleft();
    }

    function getCurrentTime() public view returns (uint256) {
        return block.timestamp;
    }
}

