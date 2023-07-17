// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Secure {
    uint public num;
    address public helper;
    address public owner;

    constructor(address _helper) {
        helper = _helper;
        owner = msg.sender;
    }

    function setNum(uint _num) public {
        require(msg.sender == owner, "You are not the ower");
        (bool success, ) = helper.delegatecall(abi.encodeWithSignature("setNum(uint256)", _num));
        require(success, "Delegate call failed");
    }
}
