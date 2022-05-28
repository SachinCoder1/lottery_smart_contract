// SPDX-License-Identifier: MIT
pragma solidity ^0.4.24;



contract Lottery {
    address[] public allPlayers; // dynamic array with all player's address;
    address public manager;  // Owner;
    
    constructor(){
        // adding the address of owner
        manager = msg.sender;
    }


    // fallback payable function -> it will be called when somebody sends ether directly to the contract address.
    function() payable public {
       allPlayers.push(msg.sender); // add the address to allPlayers array.
    }

    

}