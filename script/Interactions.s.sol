// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DevOpsTools} from "@foundry-devops/DevOpsTools.sol";

contract Interactions is Script {
    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() public {
        address latestBasicNft = DevOpsTools.get_most_recent_deployment(
            "BasicNft",
            block.chainid
        );

        mintNftOnContract(latestBasicNft);
    }

    function mintNftOnContract(address latestBasicNft) public {
        vm.startBroadcast();
        BasicNft(latestBasicNft).mintNFT(PUG_URI);
        vm.stopBroadcast();
    }
}
