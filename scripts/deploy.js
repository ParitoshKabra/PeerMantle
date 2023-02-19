// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {

  // const mantle = await hre.ethers.getContractFactory("MantleNFT");
  // const mantleNFT = await mantle.deploy();
  // await mantleNFT.deployed();
  // console.log(
  //   `MantlNFT deployed to ${mantleNFT.address}`
  // );

  // const user = await hre.ethers.getContractFactory("User");
  // const userContract = await user.deploy();
  // await userContract.deployed();
  // console.log(`UserContract deployed to ${userContract.address}`);

  const peerTube = await hre.ethers.getContractFactory("PeerTube");
  const peerTubeContract = await peerTube.deploy();
  await peerTubeContract.deployed();
  console.log(`PeerTubeContract deployed to ${peerTubeContract.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
