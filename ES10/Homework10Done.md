# Homework 10

## Optimisation 2

### 1. Why are negative numbers more expensive to store than positive numbers ?

#### Answer

```Solidity

```

Img1.

Following the Code1, Function StorePositive the push of 1, push of 0x40 offset give a total of 6 gas units, 3 gas unit respectively per push, and the sstore takes 22100 gas units, aht the end the whole storePositive Function requires 22114 gas units as shown in the img1.  

Img2. 

Following the Code2, Function StoreNegative the push of 1, the push of a not and the push of 0x50 offset give a total of 9 gas units, 3 gas unit respectively per push, and the sstore takes 22100 gas units, aht the end the whole storePositive Function requires 22117 gas units as shown in the img2.  

Img3. Shows the storage offsets with the positive 1 and negative 1.

### 2. Test the following statements in Remix, which is cheaper and why ?
> Assume that the denominator can never be zero.

#### 2.1

```Solidity
result = numerator / demoninator;
```

#### 2.2

```Solidity
assembly {
    result := div(numerator, demoninator)
}
```
#### Answer

## References

1. Lesson 10, Expert Solidity Bootcamp, 2023-05-10
