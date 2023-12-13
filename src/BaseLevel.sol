// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20; 

abstract contract Level {
  function createInstance() public payable virtual returns (address);

  function validateInstance(address payable _instance, address _player) public virtual returns (bool);
}