## Programming Basics

## Decimal & Binary Conversion

Example Number: 13

* List the powers of two. (E.g 1 2 4 8 16 32 64 128 256 ...)
* Take the largest power of two less than or equal to 13; 8.
* 13=8+5. Take the largest power of two less than or equal to 5; 4.
* Result: 13=8+4+1

After breaking down the decimal into digits, we can find out the binary representation
by listing radix and marking each digit if it exists in the values we found above;
the result will be 1101.

More example conversions:

| Decimal | Digits | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
| --- | ---  | --- | --- | --- | --- | --- | --- | --- |
| 13 | 8, 4, 1 | | | | 1 | 1 | 0 | 1 |
| 114 | 64, 32, 16, 2 | 1 | 1 | 1 | 0 | 0 | 1 | 0 |

## Bitwise Operations

| Operator | Symbol | Description |
| --- | --- | --- |
| And | & | If both LHS and RHS are 1, then the result will be 1, in all other cases result will be 0 |
| Or | \| | If both LHS and RHS are 0 then the result will be 0, in all other cases result will be 1 |
| Exclusive Or | ^ | If both LHS and RHS are same then the result will be 0, otherwise the result will be 1 |
| Complement | ~ |  If the given operand is positive integer, then add 1 and change the sign. If the given operand is negative integer, then subtract 1 and change the sign. |
| Left Shift | << | Shifts the bits of first number to left by number of positions indicated by second number |
| Right Shift | >> |     |

### `And`, `Or` and `Exclusive Or`

Get the binary equivalent of two numbers and apply the rule to their digits.

For example, 2 | 5:

| Decimal       |  16 |   8 |   4 |   2 |   1 |
| ---           | --- | --- | --- | --- | --- |
| 2             |   0 |   0 |   0 |   1 |   0 |
| 5             |   0 |   0 |   1 |   0 |   1 |
| 4 + 2 + 1 = 7 |   0 |   0 |   1 |   1 |   1 |

### Left / Right Shift

Shift given N number X times to left or right positions.

For example, 1 << 4;

|               | Decimal |  16 |   8 |   4 |   2 |   1 |
| ---           |     --- | --- | --- | --- | --- | --- |
| Input         |       1 |   0 |   0 |   0 |   0 |   1 |
| Output:       |      16 |   1 |   0 |   0 |   0 |   0 |

Another example, 7 << 2

|         | Decimal |  64 |  32 |  16 |   8 |   4 |   2 |   1 |
| ---     |     --- | --- | --- | --- | --- | --- | --- | --- |
| Input   |       7 |   0 |   0 |   0 |   0 |   1 |   1 |   1 |
| Output: |      28 |   0 |   0 |   1 |   1 |   1 |   0 |   0 |
