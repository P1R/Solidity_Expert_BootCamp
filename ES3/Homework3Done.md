# Homework 3

## HomeworkEVM1

### 1. What are the advantages and disadvantages of the 256 bit word length in the EVM

The primary advantage of this choice is its ease of use with 256-bit cryptography, such as Keccak-256 hashes or secp256k1 signatures. The 256-bit word length in the EVM offers improved security and compatibility with cryptographic operations, but it may also lead to increased memory usage and complexities in data storage and retrieval.[1]

Advantages [2] :

* Security: 256-bit cryptography provides a higher level of security against brute-force attacks and collisions blog.pagefreezer.com.
* Compatibility: The 256-bit word length is widely used and trusted in the industry for cryptographic operations.
* Avalanche effect: Even a minor change to the original information completely changes the hash value, providing a high level of data integrity.
    
Disadvantages [3]:

* Memory usage: 256-bit word length may lead to increased memory usage, as each stack item occupies more space compared to smaller word lengths.
* Padding and alignment: Different data types require different padding and alignment, which can lead to potential inefficiencies and complexities in data storage and retrieval.

### 2. What would happen if the implementation of a precompiled contract varied between Ethereum clients ?

If the implementation of a precompiled contract varied between clients, it could lead to inconsistencies, security vulnerabilities, and potential denial of service attacks. It is essential to maintain consistency through EIPs and adhere to the specified implementation details to ensure a secure and robust Ethereum network.

Some reasons for using precompiled contracts instead of native opcodes include [4]:

* Limited opcode namespace.
* Risk of name re-use.
* Utility and potential obsolescence.
* Gentle promotion of popular/useful code.

Precompiled contracts are added to the Ethereum protocol through Ethereum Improvement Proposals (EIPs), such as [EIP-197](https://eips.ethereum.org/EIPS/eip-197) for elliptic curve pairing operations used in zkSNARK verification[5] and [EIP-1108](https://eips.ethereum.org/EIPS/eip-1108) for re-pricing the elliptic curve arithmetic precompiles[6]. These EIPs define the implementation details and ensure consistency across Ethereum clients.

### 3. Using Remix write a simple contract that uses a memory variable, then using the debugger step through the function and inspect the memory

Hello World Contract Code:
```Solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld {
    string private text;

    constructor() {
        text = "Hello World";
    }

    function helloWorld() public view returns (string memory) {
        return text;
    }

    function setText(string calldata _newText) public {
        text = _newText;
    }

}
```
Code1.

The `Hello World` contract code as shown in Code1. constist on a private string to store which stores at memory, a constructor which writes the "Hello World" string on contract creation to that memory variable, public view function which returns the text string from the memory and a setText function that uses `_newText` as input variable stored at the  calldata and after writes it to the text string (memory) this updates the string message to the one the msg.sender inputs.

![image](https://user-images.githubusercontent.com/706259/234777522-eac44361-7779-4cb2-9e4c-0e1c1dc6e5ac.png)
Img1.

As showed in the Img1. The contract was deployed and the function set Text was called with a a string parameter `Hello David`

![image](https://user-images.githubusercontent.com/706259/234778795-d07e545e-c556-4642-a97c-000ee9ddba00.png)
Img2.

First State, Line4 notice that the string is `Hello World` as shown in the Img2.

![image](https://user-images.githubusercontent.com/706259/234780834-333eff41-1288-4a11-a8e8-a4341b515848.png)
Img3. 

Img3. Shows Stack, Memory, callData andStorage

![image](https://user-images.githubusercontent.com/706259/234779112-96a86ac6-d18a-40c6-a525-3f3c4d9d382f.png)
Img4

Second State, Line 15 sets the new string `Hello David` to memory, as it is shown at the Img4.

![image](https://user-images.githubusercontent.com/706259/234780487-5c27064a-09cb-46a3-bba8-e080a81eeb22.png)
Img5. 

Img5. Shows Stack, Memory, callData and Storage

## References

1. ethereum.org, https://ethereum.org/en/developers/docs/evm/, 2023-04-27
2. blog.pagefreezer.com, https://blog.pagefreezer.com/sha-256-benefits-evidence-authentication, 2023-04-27
3. ethereum.stackexchange.com, https://ethereum.stackexchange.com/questions/2327/clarification-of-256-bit-word-semantics, 2023-04-27
4. ethereum.stackexchange.com, https://ethereum.stackexchange.com/questions/440/whats-a-precompiled-contract-and-how-are-they-different-from-native-opcodes, 2023-04-27
5. EIP-197: Precompiled contracts for optimal ate pairing check on the elliptic curve alt_bn128, https://eips.ethereum.org/EIPS/eip-197, 2023-04-27
6. EIP-1108: Reduce alt_bn128 precompile gas costs, https://eips.ethereum.org/EIPS/eip-1108, 2023-04-27  
