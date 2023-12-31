//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "../lib/forge-std/src/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";

contract DeployMoodNft is Script{


    function run() external returns (MoodNft){

        vm.startBroadcast();
        vm.stopBroadcast();

    }

}