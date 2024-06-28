// SPDX-License-Identifier: MIT
pragma solidity 0.8.26; //solidity version
contract Adminonly {
    address public admin;
    string private code;

    modifier Admin() {
        require(msg.sender == admin, "Only admin can access this.");
        _;
    }
    constructor () {
        admin = msg.sender;
    }
    function setcode (string memory _code) public Admin{
        code = _code;
    }
    function getcode() public view returns (string memory){
        return code;
    }
    function changeAdmin(address newAdmin)public Admin{
        admin = newAdmin;
    }
}