# Homework 3

## Assembly 2

### 1. Create a Solidity contract with one function The solidity function should return the amount of ETH that was passed to it, and the function body should be written in assembly

#### Answer

```Solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract PayableAmount {

    function getWei() external payable returns(uint){
        assembly{
            let weiAmount:= callvalue()
            mstore(0x00, weiAmount)
            return(0,32)
        }
    }
}
```

### 2. Do you know what this code is doing ?

```assembly
push9 0x601e8060093d393df3
msize
mstore                      # mem = 000...000 601e8060093d393df3
                            #     = 000...000 spawned constructor payload

# copy the runtime bytecode after the constructor code in mem
codesize                    # cs
returndatasize              # 0 cs
msize                       # 0x20 0 cs
codecopy                    # mem = 000...000 601e8060093d393df3 RUNTIME_BYTECODE


                            # --- stack ---
push1 9                     # 9
codesize                    # cs 9
add                         # cs+9 = CS = total codesize in memory

push1 23                    # 23 CS
returndatasize              # 0 23 CS
dup3                        # CS 0 23 CS

dup3                        # 23 CS 0 23 CS
callvalue                   # v 23 CS 0 23 CS
create                      # addr1 0 23 CS
pop                         # 0 23 CS

create                      # addr2

selfdestruct
```

The code creates a contract  and transfers the remaining ether of a selfdestruct contract to the new one.

The runtime bytecode for this contract is `0x68601e8060093d393df35952383d59396009380160173d828234f050f0ff`


### 3. Can you trigger a revert in the init code in Remix ?

```Solidity
function allowanceStorageOffset(account, spender) -> offset {
    offset := accountToStorageOffset(account)
    mstore(0, offset)
    mstore(0x20, spender)
    offset := keccak256(0, 0x40)
}
```

This function calculates the storage location for an Allowance value in an ERC20 contract's storage 
(for allowance and approve operations) the keccak256 hash function is used to derivate a unique storage
slot for the allowance value based on the `acount` and `spender` parameters.

## References

1. Lesson 5, Expert Solidity Bootcamp, 2023-05-01
