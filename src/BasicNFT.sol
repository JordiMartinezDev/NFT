//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract basicNFT{

    uint private s_tokenCounter;
    constructor() ERC721("Patons","PTNS"){

        s_tokenCounter = 0;
    }

    function mintNft() public{
        
    }

}