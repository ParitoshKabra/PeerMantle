//Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract User {
    mapping(address => string) public addressToUsername;

    function addOrChangeUsername(string memory username) public {
        addressToUsername[msg.sender] = username;
    }
}
