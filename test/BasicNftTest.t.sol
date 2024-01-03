//SPDX-License-Identifier: MIT


pragma solidity ^0.8.18;

import {Test} from "../lib/forge-std/src/Test.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract BasicNftTest is Test{

    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public USER = makeAddr("user");
    string public constant patonIpfsImgUrl = "https://i.pinimg.com/originals/66/03/b7/6603b76f5332cfe06c72688028a9f1b2.png";

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

    function testSymbolIsCorrect() public view {
        string memory expectedSymbol = "PTNS";
        string memory actualSymbol = basicNft.symbol();
        assertStringsEqual(expectedSymbol, actualSymbol, "Incorrect symbol");
    }

    
    function testCanMintAndHaveBalance() public{
        vm.prank(USER);
        basicNft.mintNft(patonIpfsImgUrl);

        assert(basicNft.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(patonIpfsImgUrl)) == keccak256(abi.encodePacked(basicNft.tokenURI(0))));

    }

    function assertStringsEqual(string memory expected, string memory actual, string memory message) internal pure {
        assert(keccak256(abi.encodePacked(expected)) == keccak256(abi.encodePacked(actual)), message);
    }

}