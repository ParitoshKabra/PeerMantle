//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "./Video.sol";

contract ProxyPeerTube {
    address public _parent;

    constructor() {
        PeerTube _peer = new PeerTube();
        _parent = address(_peer);
    }

    event VideoUploaded(
        string hash,
        string title,
        string description,
        string location,
        string category,
        string thumbnailHash,
        string date,
        address author
    );

    function indexVideo(
        string memory _videoHash,
        string memory _title,
        string memory _description,
        string memory _location,
        string memory _category,
        string memory _thumbnailHash,
        string memory _date
    ) external {
        (bool sent, ) = _parent.call(
            abi.encodeWithSignature(
                "uploadVideo(string, string, string, string, string, string, string)",
                _videoHash,
                _title,
                _description,
                _location,
                _category,
                _thumbnailHash,
                _date
            )
        );
        require(sent, "Can't call remote procedure");
        emit VideoUploaded(
            _videoHash,
            _title,
            _description,
            _location,
            _category,
            _thumbnailHash,
            _date,
            msg.sender
        );
    }
}
