// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract BasicNftTest is Test {
    BasicNft private basicNft;

    function setUp() external {
        DeployBasicNft deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testBasicNftDeploy() external {
        assert(address(basicNft) != address(0));
    }

    function testNameIsCorrect() external {
        string memory nftName = "Dogie";
        string memory actualName = basicNft.name();

        assert(
            keccak256(abi.encodePacked(nftName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }
}
