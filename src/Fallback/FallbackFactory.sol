// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "../BaseLevel.sol";
import "./Fallback.sol"; 

contract FallbackFactory is Level { 

  function createInstance() public payable override returns (address) {
    Fallback instance = new Fallback();
    return address(instance); 
  }

  function validateInstance(address payable _instance, address _player) public override view returns (bool) {
    Fallback instance = Fallback(_instance);
    return instance.owner() == _player && address(instance).balance == 0; 
  }
}