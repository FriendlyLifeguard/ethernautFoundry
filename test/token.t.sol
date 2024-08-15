// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "../src/Token.sol"; 

contract TokenTest is Test {
  
  Token token = new Token(10);
  address deployer; 

  function setUp() public {
    deployer = address(10);
  }

  function testGetMoreTokens() public {

    vm.prank(deployer);
    token.transfer(address(20), 100);
  }
}