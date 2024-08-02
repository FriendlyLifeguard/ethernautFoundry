// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/console.sol";

import "../src/Telephone/callTelephone.sol";

contract deployTelephone is Script {

  function run() external {
  
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    address deployerAddress = vm.addr(deployerPrivateKey);

    vm.startBroadcast(deployerPrivateKey);

    callTelephone call = new callTelephone();

    assert(call.callChangeOwner(deployerAddress) == true);

    vm.stopBroadcast();
    
  }
}
