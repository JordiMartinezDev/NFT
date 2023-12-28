//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract basicNFT{

    uint private s_tokenCounter;
    mapping(uint => string) private s_tokenIdToUri;

    constructor() ERC721("Patons","PTNS"){

        s_tokenCounter = 0;
    }

    function mintNft(string memory tokenUri) public{

        s_tokenIdToUri[s_tokenCounter] = tokenUri;

        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;

    }

    function tokenURI(uint tokenId) public view override returns (string memory){

    }
}