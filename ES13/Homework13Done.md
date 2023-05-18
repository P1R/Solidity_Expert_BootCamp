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
b. Yul

Which one is most gas efficient ?
To help you test your solution, here are some decimal values you can use
https://gist.github.com/extropyCoder/e991809dbb4194dc5af00d6422083f99

## References

1. Lesson 13, Expert Solidity Bootcamp, 2023-05-15
2. Shifs, docs solidity, https://docs.soliditylang.org/en/v0.8.12/types.html#shifts , 2023-05-17
