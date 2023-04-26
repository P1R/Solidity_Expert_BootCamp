// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.18;

contract DeleteItems {
  uint[] items; 

    // Gets items
    function getItems() public view returns (uint[] memory) {
      return items;
    }
    // Generates Random Number from prevrandao 
    // Just as example for testing purposes
    function getRandomNumber() public view returns (uint256 randomNumber) {
        randomNumber = block.prevrandao;
    }

    // Sets RandomItems for Testing purposes
    function setRandomItems(uint amount) external {
      require(amount > 0);
      for(uint i = 0; i < amount; i ++){ 
        items.push((getRandomNumber() % 9) + 1);
      }
    } 

    // clean Items
    function cleanItems() external {
      delete items;
    } 

    // Remove item at index idx
    function removeItem(uint idx) external {
      require(idx < items.length, "index out of lenght");
      for (uint i = idx; i < items.length - 1; i++) {
        items[i] = items[i + 1];
      }
      items.pop();
    }
