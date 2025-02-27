
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
interface Bank {
    function deposit() external payable;
    function withdraw(uint256 amount) external;
    function getBalance(address account) external view returns (uint256);
}
abstract contract BankBase {
    mapping(address => uint256) internal balances;

    function getBalance(address account) public view virtual returns (uint256) {
        return balances[account];
    }
    function deposit() public virtual payable;
    function withdraw(uint256 amount) public virtual;
}
contract bank is Bank, BankBase {
    function deposit() public override(BankBase, Bank) payable {
        require(msg.value > 0, "Deposit amount must be greater than zero !!");
        balances[msg.sender] += msg.value;
    }
    function withdraw(uint256 amount) public override(BankBase, Bank) {
        require(amount <= balances[msg.sender], "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
    function getBalance(address account) public view override(BankBase, Bank) returns (uint256) {
        return balances[account];
    }
}
