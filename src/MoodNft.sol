// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

/**
@dev 
Step 1: Getting Image URI as parameters (SVG -> Base64 -> ImageURI String)
Step 2: Create the Token URI for those image uris (JSON -> Base64 -> TokenURI String)
 */

contract MoodNft is ERC721 {
    enum NFTState {
        HAPPY,
        SAD
    }

    string private s_happySvgUri;
    string private s_sadSvgUri;
    uint256 public s_tokenCounter;
    mapping(uint256 => NFTState) private s_tokenIdToState;

    constructor(
        string memory happySvgUri,
        string memory sadSvgUri
    ) ERC721("Mood NFT", "MN") {
        s_happySvgUri = happySvgUri;
        s_sadSvgUri = sadSvgUri;
        s_tokenCounter = 0;
    }

    /**
    Here we are mapping the tokenCounter to the NFTState (and not directly to tokenUri)
    because the tokenUri will change based on the NFTState (Ref: tokenURI()) for our MoodNFT
     */
    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToState[s_tokenCounter] = NFTState.HAPPY;
        s_tokenCounter++;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function tokenURI(
        uint256 tokenId
    ) public view virtual override returns (string memory) {
        string memory imageUri;

        if (s_tokenIdToState[tokenId] == NFTState.HAPPY) {
            imageUri = s_happySvgUri;
        } else {
            imageUri = s_sadSvgUri;
        }

        return
            string(
                abi.encodePacked(
                    _baseURI(),
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name":"',
                                name(), // You can add whatever name here
                                '", "description":"An NFT that reflects the mood of the owner, 100% on Chain!", ',
                                '"attributes": [{"trait_type": "moodiness", "value": 100}], "image":"',
                                imageUri,
                                '"}'
                            )
                        )
                    )
                )
            );
    }
}
