//Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Streamer {
    mapping(string => address) public linkToStreamer;

    function addLinkStreamerMap(string memory link) public {
        linkToStreamer[link] = address(msg.sender);
    }
}
