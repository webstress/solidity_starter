// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AdminAccess {
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "This function is only accessible by admins");
        _;
    }

    function setAdmin(address _newAdmin) public onlyAdmin {
        admin = _newAdmin;
    }

    function adminFunction() public onlyAdmin returns (string memory) {
        return "This function is only accessible by admins";
    }

    // Example function accessible to everyone
    function publicFunction() public view returns (string memory) {
        return "This function is accessible to everyone";
    }
}
