// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Telephone/callTelephone.sol";

contract TelephoneTest is Test {

  Telephone telephone = new Telephone();
  callTelephone call = new callTelephone(); 
  address newOwner; 
  
  function setUp() public {
    newOwner = address(20);
    telephone = Telephone(0x2E78367Aa9AF40908FA8BC979Ce6AeF31BC3920b);
  }

  function testChangeOwner() public {

   vm.prank(newOwner);
   call.callChangeOwner(newOwner);
   assertEq(telephone.owner(), newOwner);
  }


  

}