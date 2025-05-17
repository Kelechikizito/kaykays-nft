// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {KayKayNFT} from "src/KayKayNFT.sol";

contract DeployKayKayNFT is Script {
    function run() external returns (KayKayNFT) {
        vm.startBroadcast();
        KayKayNFT kayKayNFT = new KayKayNFT();
        vm.stopBroadcast();
        return kayKayNFT;
    }
}
