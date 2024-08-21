// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/console.sol";

import "../src/Force/CallForce.sol";

contract deployForce is Script {

  function run() external {

  address forceAddress = 0x2B259384De4571fE3549418814254E3eCf01E2Ee;

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  vm.startBroadcast(deployerPrivateKey);

  CallForce callForce = new CallForce(forceAddress);

  console.log("Deploying CallForce contract with address:", address(callForce));

  console.log("Balance before attack:", address(forceAddress).balance);
  callForce.attack{value: 0.1 ether}();
  console.log("Balance after attack:", address(forceAddress).balance);


  // assert(address(forceAddress).balance == 0.1 ether);

  vm.stopBroadcast();

  }

}