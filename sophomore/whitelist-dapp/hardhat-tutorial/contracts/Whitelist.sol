//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // Creating a mapping of whitelisted addresses
    // if an address is whitelisted, we would set it
    // to true, it is false by default for all other addresses.
    mapping(address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted would be used to keep track of
    // how many addresses have been whitelisted
    // NOTE: Don't change this variable name, as it will be part of verification
    uint8 public numAddressesWhitelisted;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /*
        addAddressToWhitelist - This function adds the address of the sender to the
        whitelist
     */

    function addAddressToWhitelist() public {
        // check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");

        // check if numAddressesWhitelisted < maxWhitelistedAddresses; else 
        // thrown an error that maximum limit reached
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More Addresses cannot be added, limit reached");

        // Add the address which called the function
        whitelistedAddresses[msg.sender] = true;

        // Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}
