// SPDX-License-Identifier: MIT
pragma solidity ^0.4.24;



contract Lottery {
    address[] public allPlayers; // dynamic array with all player's address;
    address public manager;  // Owner;
    
    constructor(){
        // adding the address of owner
        manager = msg.sender;
    }
    
}