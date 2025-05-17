// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/// @title KayKayNFT
/// @author Kelechi Kizito Ugwu
/// @notice This contract is an ERC721 token that represents a KayKay NFT.
/// @dev Implements OpenZeppelin ERC-721 Contracts

contract KayKayNFT is ERC721 {
    // STATE VARIABLES
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToURI;

    constructor() ERC721("KAYKAY", "KK") {
        s_tokenCounter = 0;
    }

    function mintNft(string memory _tokenURI) public {
        s_tokenIdToURI[s_tokenCounter] = _tokenURI;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return s_tokenIdToURI[tokenId];
    }
}
