// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract MessageContextExample {
    address public owner;
    uint256 public contractBalance;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function deposit() external payable {
        contractBalance += msg.value;
    }

    function withdraw(uint256 _amount) external onlyOwner {
        require(_amount <= contractBalance, "Insufficient contract balance");
        payable(owner).transfer(_amount);
        contractBalance -= _amount;
    }

    function getMessageSender() external view returns (address) {
        return msg.sender;
    }

    function getMessageValue() external view returns (uint256) {
        return msg.value;
    }

    function getMessageData() external view returns (bytes calldata) {
        return msg.data;
    }

    function getMessageGas() external view returns (uint256) {
        return gasleft();
    }

    function getMessageOrigin() external view returns (address) {
        return tx.origin;
    }
}
