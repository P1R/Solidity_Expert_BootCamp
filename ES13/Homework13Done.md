# Homework 13

## Solidity / Yul bitwise

### 1. What are the potential dangers when performing the following bitwise operations

1. Left shift
2. Right shift

#### Answer

In Solidity, bitwise operations such as left shift and right shift can be performed on integers and fixed-size byte arrays. However, there are some potential dangers when performing these operations, especially if you're not careful with the data types and the values being shifted.

1. Left Shift:

The left shift operation `x << y` is equivalent to the mathematical expression `x * 2**y`. However, there are some potential dangers when performing left shift operations:

- Overflow: Left shift can cause overflow if the result exceeds the maximum value representable by the type of the left operand. In checked arithmetic mode (default), this will cause a failing assertion, while in wrapping mode, the result will be truncated [2](https://docs.soliditylang.org/en/v0.8.12/types.html#shifts).

Example:
```solidity
uint8 a = 128;
uint8 b = a << 1; // This will cause an overflow and a failing assertion in checked arithmetic mode
```

2. Right Shift:

The right shift operation `x >> y` is equivalent to the mathematical expression `x / 2**y`, rounded towards negative infinity. However, there are some potential dangers when performing right shift operations:

- Rounding: Right shift operations round towards negative infinity, which can lead to unexpected results, especially when working with signed integers [2](https://docs.soliditylang.org/en/v0.8.12/types.html#shifts).

Example:
```solidity
int8 a = -5;
int8 b = a >> 1; // b will be -3, because -5 / 2**1 is rounded towards negative infinity
```

- Type restrictions: The right operand must be of unsigned type; trying to shift by a signed type will produce a compilation error [2](https://docs.soliditylang.org/en/v0.8.12/types.html#shifts).

Example:
```solidity
uint8 a = 8;
int8 b = -1;
uint8 c = a >> b; // This will produce a compilation error because the right operand is a signed type
```

To avoid these potential dangers, make sure to use appropriate data types and be aware of the behavior of shift operations, especially when working with signed integers and large values. Additionally, consider using checked arithmetic mode (default) to catch overflows and other unexpected results.


### 2. Bit Operations
Imagine you have a uint256 variable in storage named x
check if x starts with de or be

if x starts with 0xde multiply x by 4

if x starts with 0xbe divide x by 4
Write the code in

a. Solidity
```Solidity
// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

contract Bitwise {
    uint256 public x;
    uint256 internal constant de = 0xde00000000000000000000000000000000000000000000000000000000000000;
    uint256 internal constant be = 0xbe00000000000000000000000000000000000000000000000000000000000000;

    function processX(uint256 _x) external {
        if (de == (_x & de))
            x = _x * 4;
        if (be == (_x & be))
            x = _x / 4;
    }
}
```
Code1. referenced from the [project bitwise](https://github.com/P1R/bitwise)

b. Yul

```Solidity
// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

contract Bitwise {
    uint256 public x;
    
    function processX(uint256 _x) external {
        assembly {
            let mask_de := 0xde00000000000000000000000000000000000000000000000000000000000000
            let mask_be := 0xbe00000000000000000000000000000000000000000000000000000000000000
            let result := and(_x, mask_de)
            if eq(result, mask_de) {
                result := shl(2, _x)
            }
            result := and(_x, mask_be)
            if eq(result, mask_be) {
                result := shr(2, _x)
            }
            sstore(0, result)
        }
    }
}
```
Code2. referenced from the [project bitwise](https://github.com/P1R/bitwise)

Which one is most gas efficient ?

Answer: The Yul version is more eficient since it uses way less OPCodes

To help you test your solution, here are some decimal values you can use
https://gist.github.com/extropyCoder/e991809dbb4194dc5af00d6422083f99

## References

1. Lesson 13, Expert Solidity Bootcamp, 2023-05-15
2. Shifs, docs solidity, https://docs.soliditylang.org/en/v0.8.12/types.html#shifts , 2023-05-17
3. bitwise, David E. Perez Negron R. https://github.com/P1R/bitwise , 2023-05-17
