// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../BaseLevel.sol";
import "./Coinflip.sol";

contract CoinflipFactory is Level {

  function createInstance() public payable override returns (address) {
    CoinFlip instance = new CoinFlip();
    return address(instance);
  }

  function validateInstance(address payable _instance, address) public override view returns (bool) {
    CoinFlip instance = CoinFlip(_instance);
    return instance.consecutiveWins() == 10;
  }
}