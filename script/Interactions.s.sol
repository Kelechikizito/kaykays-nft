// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {KayKayNFT} from "src/KayKayNFT.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintKayKayNFT is Script {
    string public constant KAYKAY_URI =
        "https://ipfs.io/ipfs/QmUJ2qNuXbsVoVmi9jEiMv4sQR4jkMEU3QdtFxnncP7aWC/";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "KayKayNFT",
            block.chainid
        );
        mintNFTOnContract(mostRecentlyDeployed);
    }

    function mintNFTOnContract(address contractAddress) public {
        vm.startBroadcast();
        KayKayNFT(contractAddress).mintNft(KAYKAY_URI);
        vm.stopBroadcast();
    }
}
