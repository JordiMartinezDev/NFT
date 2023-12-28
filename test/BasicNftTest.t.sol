//SPDX-License-Identifier: MIT


pragma solidity ^0.8.18;

import {Test} from "../lib/forge-std/src/Test.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract BasicNftTest is Test{

    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public USER = makeAddr("user");
    string public constant patonIpfsImgUrl = "https://ipfs.io/ipns/k51qzi5uqu5dk2bqde7fgmi263t3qibkzen64vzzjg7zkcixpmshs9gafrro1t";

    function setUp() public{
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view{

        string memory expectedName = "Patons";
        string memory actualName = basicNft.name();

        //To compare the two strings, we will need to compare their hashes. Hashes of their abi.encodePacked

        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));

    }

    function testCanMintAndHaveBalance() public{
        vm.prank(USER);
        basicNft.mintNft(patonIpfsImgUrl);

        assert(basicNft.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(patonIpfsImgUrl)) == keccak256(abi.encodePacked(basicNft.tokenURI(0))));

    }

}