opcode-rs-rt-rd-shamt-funct
R type: 6-5-5-5-5-6
I type: 6-5-5-16

# a -> $s0, b -> $s1, c -> $s2
addi $s0, $zero, 0 
000101 00000 01000 0000000000000000
addi $s1, $zero, 4
000101 00000 01001 0000000000000100
addi $s2, $zero, 8
000101 00000 01010 0000000000001000

# Initialize a
addi $t0, $zero, 5
sw $t0, 0($s0)
addi $t0, $zero, 7
sw $t0, 1($s0)
addi $t0, $zero, -2
sw $t0, 2($s0)
addi $t0, $zero, 40
sw $t0, 3($s0)

# Initialize b
addi $t0, $zero, 65
sw $t0, 0($s1)
addi $t0, $zero, -23
sw $t0, 1($s1)
addi $t0, $zero, 17
sw $t0, 2($s1)
addi $t0, $zero, 1024
sw $t0, 3($s1)

# Initialize c
addi $t0, $zero, 0
sw $t0, 0($s2)
addi $t0, $zero, 0
sw $t0, 1($s2)
addi $t0, $zero, 0
sw $t0, 2($s2)
addi $t0, $zero, 0
sw $t0, 3($s2)

# Assuming the corresponding data is written in the memory.

# set $t0 = 4 for comparison
addi $t0, $zero, 4
000101 00000 00001 0000000000000100
# set $t4 = 2 for multiplication
addi $t4, $zero, 2
000101 00000 00101 0000000000000010

# set $t1 (i) = 0
addi $t1, $zero, 0
000101 00000 00010 0000000000000000

loop:

beq $t0, $t1, exit
001100 00001 00010 0000000000001011
add $t2, $t1, $s0
000000 00010 01000 00011 00000 000000
lw $t2, 0($t2)
001010 00011 00011 0000000000000000
add $t3, $t1, $s1
000000 00010 01001 00100 00000 000000
lw $t3, 0($t3)
001010 00100 00100 0000000000000000
# a[i] + b[i]
add $t2, $t2, $t3
000000 00011 00100 00011 00000 000000

mult $t4, $t2
000010 00011 00000 00101 00000 000000
mflo $t2
001001 00000 00000 00011 00000 000000
add $t5, $t1, $s2
000000 00010 01010 00011 00000 000000
sw $t2, 0($t5)
001011 00011 00110 0000000000000000

addi $t1, $t1, 1
000101 00010 00010 0000000000000001

j loop
001110 00000 00000 0000000000000110

exit: