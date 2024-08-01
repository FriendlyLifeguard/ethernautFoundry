// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "./Fallback/FallbackFactory.sol";
import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol"; 

contract Ethernaut is Ownable {

  constructor() Ownable(msg.sender){}

  // Owner Interaction

  mapping(address => bool) registeredLevels; 

  //registers an instance of a level 
  function registerLevel(Level _level) public onlyOwner {
    registeredLevels[address(_level)] = true; 
  }

  // Get/submit level instances 

  struct EmittedInstanceData {
    address player;
    Level level; 
    bool completed; 
  }

  mapping(address => EmittedInstanceData) emittedInstances; 

  event LevelInstanceCreatedLog(address indexed player, address instance);
  event LevelCompletedLog(address indexed player, Level level); 

  function createLevelInstance(Level _level) public payable returns (address){
    // Make sure the level is registered 
    require(registeredLevels[address(_level)]); 
    // We access the createInstance function from _level object which will create a new instance of the Fallback contract
    address instance = _level.createInstance();

    emittedInstances[instance] = EmittedInstanceData(
      msg.sender,
      _level,
      false
    );

    // Retrived created instance via logs 
    emit LevelInstanceCreatedLog(msg.sender, instance);

    return instance; 
  } 

  function submitLevelInstance(address payable _instance) public returns (bool) {
    EmittedInstanceData storage data = emittedInstances[_instance];
    require(data.player == msg.sender); 
    require(data.completed == false);

    if (data.level.validateInstance(_instance, msg.sender)) {
      data.completed = true; 

      emit LevelCompletedLog(msg.sender, data.level); 

      // return true if the level was completed
      return true; 
    }
    // otherwise return false 
    return false; 
  }
}