# COMP 303 Final Project - Single Cycle Processor

## Student names: Ahmet Uysal - Furkan Sahbaz

## Student IDs: 60780 - 60124

## Supported Instructions

| Instruction       | Opcode | Type | Operation                  |
| ----------------- | ------ | ---- | -------------------------- |
| add rd, rs, rt    | 000000 | R    | rd = rs + rt               |
| sub rd, rs, rt    | 000001 | R    | rd = rs - rt               |
| mult rs, rt       | 000010 | R    | hi;lo = rs\*rt             |
| and rd, rs, rt    | 000011 | R    | rd = rs & rt               |
| or rd, rs, rt     | 000100 | R    | rd = rs \|rt               |
| addi rd, rs, I    | 000101 | I    | rd = rs + I                |
| sll rd, rs, shamt | 000110 | R    | rd = rs << shamt           |
| slt rd, rs, rt    | 000111 | R    | rd = (rs < rt)             |
| mfhi rd           | 001000 | R    | rd = hi                    |
| mflo rd           | 001001 | R    | rd = lo                    |
| lw rd, i(rs)      | 001010 | I    | rd = rs[i]                 |
| sw rs, i(rd)      | 001011 | I    | rd[i] = rs                 |
| beq rs, rt, label | 001100 | I    | if(rs == rt) jump to label |
| blez rs, label    | 001101 | I    | if(rs <= 0) jump to label  |
| j label           | 001110 | J    | Jump to label              |
| **sqr rd, rs**    | 001111 | R    | rd = rs<sup>2</sup>        |

## Register File

| Register Number | Conventional Name | Description                                  |
| --------------- | ----------------- | -------------------------------------------- |
| \$0             | \$zero            | Hard-wired to 0                              |
| $1 - $7         | $t0 - $t6         | Temporary data, not preserved by subprograms |
| $8 - $14        | $s0 - $s6         | Saved registers, preserved by subprograms    |
| \$15            | \$sp              | Stack Pointer                                |

## 16-Bit Adder

## ALU

| ALUOp | Operation                 | Description |
| ----- | ------------------------- | ----------- |
| 0000  | Result = Input1 + Input 2 | ASDF        |
| 0001  | Result = Input1 + Input 2 | ASDF        |
| 0010  | Result = Input1 + Input 2 | ASDF        |
| 0011  | Result = Input1 + Input 2 | ASDF        |
| 0100  | Result = Input1 + Input 2 | ASDF        |
| 0101  | Result = Input1 + Input 2 | ASDF        |
| 0110  | Result = Input1 + Input 2 | ASDF        |
| 0111  | Result = Input1 + Input 2 | ASDF        |
| 1000  | Result = Input1 + Input 2 | ASDF        |
| 1001  | Result = Input1 + Input 2 | ASDF        |

## Control Unit
