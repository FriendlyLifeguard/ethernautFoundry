# Ethernaut_with_foundry 



Learning with https://github.com/Simon-Busch/Foundry-ethernaut-solutions/tree/main repo 


## Setup 


For each level, the respective factory contract is defined to create and validates the instance of the level to ensure the hack is successful.
- These must be customized for each level as each level has different setup/hack procedures.

Ethernaut.sol contract is the base contract where all the level instances are stored and to register and create/validate through the respective level's factory contracts.

BaseLevel.sol is an abstract contract that defines the interface for creating/validating each level instances. 

## todo 




