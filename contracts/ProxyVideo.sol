//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "./Video.sol";

contract ProxyPeerTube {
    address payable public _parent;
    address payable public _creator =
        payable(0x88A4643d6900C28086aD21148D5CfffD32fA37C5);

    constructor() {
        PeerTube _peer = new PeerTube();
        _parent = payable(address(_peer));
    }

    event VideoUploaded(
        string videoId,
        string name,
        string description,
        uint256 createdAt,
        uint256 durationInSeconds,
        string downloadUrl,
        string playbackId,
        address author
    );

    function indexVideo(
        string memory videoId,
        string memory name,
        string memory description,
        uint256 createdAt,
        uint256 durationInSeconds,
        string memory downloadUrl,
        string memory playbackId
    ) external {
        (bool sent, ) = _parent.call(
            abi.encodeWithSignature(
                "uploadVideo(string, string, string, string, string, string, string)",
                videoId,
                name,
                description,
                createdAt,
                durationInSeconds,
                downloadUrl,
                playbackId,
                msg.sender
            )
        );
        require(sent, "Can't call remote procedure");
        emit VideoUploaded(
            videoId,
            name,
            description,
            createdAt,
            durationInSeconds,
            downloadUrl,
            playbackId,
            msg.sender
        );
    }

    fallback() external payable {
        // React to receiving ether
        _creator.transfer(address(this).balance);
    }

    receive() external payable {
        // custom function code
    }
}
