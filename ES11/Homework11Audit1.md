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

The Following Audit Report will cover these sections which where found:

#### 1. Access control: 
> To Ensure that the smart contract implements appropriate access controls to prevent unauthorized access or modification.

The contract lacks proper access control measures, which means that anyone can add players to the game by calling the addPlayer function, without any restrictions. This makes it easy for malicious actors to manipulate the game and cheat other players. We recommend implementing access controls to restrict access to certain functions and actions only to authorized parties.

#### 2. Input validation: 
> To Check that input data is validated to prevent unexpected or malicious behavior, such as integer overflow or underflow.

The addPlayer function does not validate the input parameters. This can lead to errors and vulnerabilities, such as integer overflows, underflows, and incorrect data types. We recommend implementing input validation checks for all user input parameters to prevent these issues.

#### 3. Reentrancy: 
> Ensure that the smart contract is not vulnerable to reentrancy attacks, where an attacker can repeatedly call a contract function to exploit a vulnerability.

The payWinners function contains a potential reentrancy vulnerability, which occurs when a malicious contract or user repeatedly calls the send function to drain funds from the contract. To prevent this, we recommend implementing the Checks-Effects-Interactions pattern to ensure that all state changes are completed before interacting with external contracts or functions.

#### 4. Code quality: 
> Verify that the code is written with best practices in mind, is easy to read and understand, and is well-documented.

The payout function uses a loop to pay out the winners, which can potentially exceed the block gas limit and cause the transaction to fail. We recommend using a more efficient payout mechanism, such as a batch payout, to avoid this issue.

The startPayout event can potentially be abused by malicious actors to spam the UI with fake payout notifications. To prevent this, we recommend implementing event filtering mechanisms to ensure that only valid events are displayed to the UI.


#### Conclusions

There are several critical security issues that must be addressed to ensure the safety and security of the DogCoinGame platform. By implementing the suggested changes and improvements to mitigate these vulnerabilities and ensure that the platform is secure and reliable.


## References

1. Lesson 11, Expert Solidity Bootcamp, 2023-05-10
2. DogCoinGame.sol, https://github.com/ExtropyIO/ExpertSolidityBootcamp/blob/main/exercises/audit/DogCoinGame.sol , 2023-05-10

