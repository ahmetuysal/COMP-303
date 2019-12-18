# a -> $s0, b -> $s1, c -> $s2
addi $s0, $zero, 0
addi $s1, $zero, 4
addi $s2, $zero, 8

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

# set $t0 = 4 for comparison
addi $t0, $zero, 4

# set $t4 = 2 for multiplication
addi $t4, $zero, 2

# set $t1 (i) = 0
addi $t1, $zero, 0

loop:

beq $t0, $t1, exit

add $t2, $t1, $s0
lw $t2, 0($t2)
add $t3, $t1, $s1
lw $t3, 0($t3)
# a[i] + b[i]
add $t2, $t2, $t3

mult $t4, $t2
mflo $t2
add $t5, $t1, $s2
sw $t2, 0($t5)

addi $t1, $t1, 1

j loop

exit: