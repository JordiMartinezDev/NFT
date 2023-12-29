// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "../lib/forge-std/src/Script.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract MintBasicNft is Script {
    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    string public constant PATON = "https://ipfs.io/ipns/k51qzi5uqu5dk2bqde7fgmi263t3qibkzen64vzzjg7zkcixpmshs9gafrro1t";

    function run() external {
        /* THE FOLLOWING CODE IS NOT WORKING SO I JUST USED THE ADDRESS FOR TEST 

        It is not working due to permissions even if the ffi = true is set in .toml*/

        /**The following line of code was needed to make DevOpsTools work:

        fs_permissions = [{ access = "read", path = "./broadcast" }, { access = "read", path = "./reports" }]
        
         */

        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "BasicNft", block.chainid
        );
        
        //address mostRecentlyDeployed;
        
        //mostRecentlyDeployed = 0xBcb3300D9a4fB01030E7e73752664388abC242ce;
        

        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(PUG);
        vm.stopBroadcast();

    }
}