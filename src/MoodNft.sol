//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract MoodNft is ERC721{

    uint private s_tokenCounter;
    string private s_sadSvg;
    string private s_happySvg;

    constructor(string memory happySvgImgUri, string memory sadSvgImgUri) ERC721("Mood NFT", "MN"){

        s_tokenCounter = 0;
        s_sadSvg = sadSvgImgUri;
        s_happySvg = happySvgImgUri;

    }

    function mintNft() public{
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint tokenId) public view override returns(string memory){

    }
}