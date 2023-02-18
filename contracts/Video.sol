//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract PeerTube {
    // Declaring the videoCount 0 by default
    uint256 public videoCount = 0;
    // Name of your contract
    string public contractName = "PeerTube";
    // Creating a mapping of videoCount to Video
    mapping(string => Video) public videos;
    address public _owner;
    address payable public _creator =
        payable(0x88A4643d6900C28086aD21148D5CfffD32fA37C5);

    constructor() {
        _owner = msg.sender;
    }

    modifier isOwner() {
        require(_owner == msg.sender);
        _;
    }

    //  Create a struct called 'Video' with the following properties:
    struct Video {
        string videoId;
        string name;
        string description;
        uint256 createdAt;
        uint256 durationInSeconds;
        string downloadUrl;
        string playbackId;
        address author;
    }

    // Create a 'VideoUploaded' event that emits the properties of the video
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

    // Function to upload a video
    function uploadVideo(
        string memory videoId,
        string memory name,
        string memory description,
        uint256 createdAt,
        uint256 durationInSeconds,
        string memory downloadUrl,
        string memory playbackId,
        address author
    ) public isOwner {
        // Validating the video hash, title and author's address
        require(bytes(videoId).length > 0);
        require(bytes(name).length > 0);

        // Incrementing the video count
        videoCount++;
        // Adding the video to the contract
        videos[videoId] = Video(
            videoId,
            name,
            description,
            createdAt,
            durationInSeconds,
            downloadUrl,
            playbackId,
            author
        );
        // Triggering the event
        emit VideoUploaded(
            videoId,
            name,
            description,
            createdAt,
            durationInSeconds,
            downloadUrl,
            playbackId,
            author
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
