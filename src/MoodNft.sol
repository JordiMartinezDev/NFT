//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Base64} from "../lib/openzeppelin-contracts/contracts/utils/Base64.sol";

contract MoodNft is ERC721{

    uint private s_tokenCounter;
    string private s_sadSvgImgUri;
    string private s_happySvgImgUri;

    enum Mood{
        HAPPY,
        SAD
    }

    mapping(uint => Mood) private s_tokenIdToMood;
    constructor(string memory happySvgImgUri, string memory sadSvgImgUri) ERC721("Mood NFT", "MN"){

        s_tokenCounter = 0;
        s_sadSvgImgUri = sadSvgImgUri;
        s_happySvgImgUri = happySvgImgUri;

    }

    function mintNft() public{
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToMood[s_tokenCounter] = Mood.HAPPY;
        s_tokenCounter++;
    }

    function _baseURI() internal pure override returns (string memory){

        return "data:application/json;base64,";

    }
    function tokenURI(uint tokenId) public view override returns(string memory){

        string memory imageURI;

        if(s_tokenIdToMood[tokenId] == Mood.HAPPY){
            imageURI = s_happySvgImgUri;
        }else imageURI = s_sadSvgImgUri;
            
        
        
        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes( // bytes casting actually unnecessary as 'abi.encodePacked()' returns a bytes
                        abi.encodePacked(
                            '{"name":"',
                            name(), 
                            '", "description":"An NFT that reflects the mood of the owner, 100% on Chain!", ',
                            '"attributes": [{"trait_type": "moodiness", "value": 100}], "image":"',
                            imageURI,
                            '"}'
                        )
                    )
                )
            )
        );
    }

    
}