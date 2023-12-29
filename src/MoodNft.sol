//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract MoodNft is ERC721{

    constructor(string memory happySvg, string memory sadSvg) ERC721("Mood NFT", "MN"){

    }
}