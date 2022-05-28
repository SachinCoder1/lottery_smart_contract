// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;



contract Lottery {
    address public owner;  // Owner;
    address payable[] public allPlayers; // dynamic array with all player's address which is payable;
    
    constructor(){
        // adding the address of owner
        owner = msg.sender;
    }

   
    // Enter the lottery
    function addLottery () public payable {
        // require a lottery balance before executing below lines.
        require(msg.value > 0.1 ether);

        // If ethers are there then add the address.
        allPlayers.push(payable(msg.sender));
    }

    // Get random number by using keccak256 algorithm ( Not a stable thing to do)
    function randomNumber() public view returns(uint){
        return uint(keccak256(abi.encodePacked(owner, block.timestamp)));
    }
    

    // getting winner using random number
    function winner() public onlyOwner{
        uint index  = randomNumber() % allPlayers.length;
        allPlayers[index].transfer(address(this).balance);

        // clear the players
        allPlayers = new address payable[](0);
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }


}