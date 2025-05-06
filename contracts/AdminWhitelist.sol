// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AdminWhitelist {
    address public owner;
    mapping(address => bool) public whitelistedAdmins;
    
    event AdminAdded(address indexed admin);
    event AdminRemoved(address indexed admin);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not contract owner");
        _;
    }

    function addAdmin(address _admin) external onlyOwner {
        whitelistedAdmins[_admin] = true;
        emit AdminAdded(_admin);
    }

    function removeAdmin(address _admin) external onlyOwner {
        whitelistedAdmins[_admin] = false;
        emit AdminRemoved(_admin);
    }

    function isAdmin(address _admin) external view returns (bool) {
        return whitelistedAdmins[_admin];
    }
}