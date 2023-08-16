// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    MoodNft public moodNft;

    function run() external returns (MoodNft) {
        string memory happySvgImageUri = vm.readFile("./images/happy.svg");
        string memory sadSvgImageUri = vm.readFile("./images/sad.svg");

        vm.startBroadcast();
        moodNft = new MoodNft(
            convertSvgToImageUri(happySvgImageUri),
            convertSvgToImageUri(sadSvgImageUri)
        );
        vm.stopBroadcast();
        return moodNft;
    }

    function convertSvgToImageUri(
        string memory svg
    ) public pure returns (string memory) {
        // svg -> bytes 32 -> bytes 64 -> concadinate base url -> string
        string memory baseUrl = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(
            bytes(abi.encodePacked(svg))
        );
        string memory imageUri = string(
            abi.encodePacked(baseUrl, svgBase64Encoded)
        );
        return imageUri;
    }
}
