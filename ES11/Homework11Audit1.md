# Homework 11

## Audit 1

### Information
>Imagine you have been given the following code to audit

```Solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DogCoinGame is ERC20 {
    uint256 public currentPrize;
    uint256 public numberPlayers;
    address payable[] public players;
    address payable[] public winners;

    event startPayout();

    constructor() ERC20("DogCoin", "DOG") {}

    function addPlayer(address payable _player) public payable {
        if (msg.value == 1) {
            players.push(_player);
        }
        numberPlayers++;
        if (numberPlayers > 200) {
            emit startPayout();
        }
    }

    function addWinner(address payable _winner) public {
        winners.push(_winner);
    }

    function payout() public {
        if (address(this).balance == 100) {
            uint256 amountToPay = winners.length / 100;
            payWinners(amountToPay);
        }
    }

    function payWinners(uint256 _amount) public {
        for (uint256 i = 0; i <= winners.length; i++) {
            winners[i].send(_amount);
        }
    }
}
```
code1. DogCoinGame

Team Note:

"DogCoinGame is a game where players are added to the contract via the addPlayer function,
they need to send 1 ETH to play.
Once 200 players have entered, the UI will be notified by the startPayout event, and will pick 100
winners which will be added to the winners array, the UI will then call the payout function to pay
each of the winners.
The remaining balance will be kept as profit for the developers."

### Audit Report
>Write out the main points that you would include in an audit report.


## References

1. Lesson 11, Expert Solidity Bootcamp, 2023-05-10
2. DogCoinGame.sol, https://github.com/ExtropyIO/ExpertSolidityBootcamp/blob/main/exercises/audit/DogCoinGame.sol , 2023-05-10

