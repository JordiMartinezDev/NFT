//SPDX-License-Identifier: MIT


pragma solidity ^0.8.18;

import {Test} from "../lib/forge-std/src/Test.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract BasicNftTest is Test{

    DeployBasicNft public deployer;
    BasicNft public basicNft;

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

}