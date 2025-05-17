// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {KayKayNFT} from "src/KayKayNFT.sol";
import {DeployKayKayNFT} from "script/DeployKayKayNFT.s.sol";

contract KayKayNFTest is Test {
    KayKayNFT kayKayNFT;
    DeployKayKayNFT deployer;

    address public USER = makeAddr("user");
    string public constant KAYKAY_URI =
        "ipfs://QmUJ2qNuXbsVoVmi9jEiMv4sQR4jkMEU3QdtFxnncP7aWC";

    function setUp() public {
        deployer = new DeployKayKayNFT();
        kayKayNFT = deployer.run();
    }

    function testNameIsCorrect() public view {
        assertEq(
            keccak256(abi.encodePacked(kayKayNFT.name())),
            keccak256(abi.encodePacked("KAYKAY"))
        );
    }

    function testSynbolIsCorrect() public view {
        assertEq(
            keccak256(abi.encodePacked(kayKayNFT.symbol())),
            keccak256(abi.encodePacked("KK"))
        );
    }

    function testCanMintAndHaveBalance() public {
        vm.prank(USER);
        kayKayNFT.mintNft(KAYKAY_URI);

        assertEq(kayKayNFT.balanceOf(USER), 1);
        assertEq(
            keccak256(abi.encodePacked(KAYKAY_URI)),
            keccak256(abi.encodePacked(kayKayNFT.tokenURI(0)))
        );
    }
}
