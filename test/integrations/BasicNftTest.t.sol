// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";
import {BasicNft} from "../../src/BasicNft.sol";

contract BasicNftTest is Test {
    BasicNft private basicNft;
    address public USER = makeAddr("user");
    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

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

    function testUserCanMintAndHaveBalance() external {
        vm.prank(USER);
        basicNft.mintNFT(PUG_URI);

        assert(basicNft.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(basicNft.tokenURI(0))) ==
                keccak256(abi.encodePacked(PUG_URI))
        );
    }
}
