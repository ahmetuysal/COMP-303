# Problem 1
# Write an MIPS Assembly version of the following C code segment
# Address of array A & B are in registers $a0 and $a1

# int A[40], B[40];
# for (i = 1; i < 40; i++) {
#   B[i] = A[i] + A[i - 1];
#   A[i] = 5 * B[i];
# }

addi	$s0, $zero, 1			# i = 0 + 1
addi	$t0, $zero, 40		# temp0 = 0 + 40

Loop: bge $s0, $t0, Exit	# if i >= temp0 then Exit
# Shift i left by 2 bits as it will be used in load
sll $t1, $s0, 2 # temp1 = 4 * i
add		$t2, $a0, $t1		# temp2 = address of A[i]
lw		$t3, 0($t2)		# Load temp3 = A[i] 
lw    $t4, -4($t2)  # Load temp4 = A[i - 1]
add		$t5, $t3, $t4		# temp5 = A[i] + A[i - 1]

add		$t6, $a1, $t1		# temp6 = address of B[i]
sw		$t5, 0($t6)		# Save temp5 (A[i] + A[i-1]) to B[i]

lw		$t7, 0($t6)		# Load temp7 = B[i]
addi  $t8, $zero, 5 # temp5 = 0 + 5

mult	$t7, $t8			# temp7 * temp8 = Hi and Lo registers
mflo	$t9					  # copy Lo to temp9
sw    $t9 0($t3)    # Save temp9 to A[i]
addi	$s0, $s0, 1			# i = i + 1

j		Loop				# jump to Loop

Exit: ...

# Part 2: Optimize memory operations
# Use minimum amount of instructions as possible 

addi	$s0, $zero, 1			# i = 0 + 1
addi	$t0, $zero, 40		# temp0 = 0 + 40
addi  $t1, $zero, 5     # temp1 = 0 + 5

Loop: bge $s0, $t0, Exit	# if i >= temp0 then Exit
# Shift i left by 2 bits as it will be used in load
sll   $t2, $s0, 2   # temp2 = 4 * i
add		$t3, $a0, $t2	# temp3 = address of A[i]
lw		$t4, 0($t3)		# Load temp4 = A[i] 
lw    $t5, -4($t3)  # Load temp5 = A[i - 1]
add		$t6, $t4, $t5	# temp6 = A[i] + A[i - 1]

add		$t7, $a1, $t2	# temp7 = address of B[i]
sw		$t6, 0($t7)		# Save temp6 (A[i] + A[i-1]) to B[i]

mult	$t1, $t6			# temp1(5) * temp6(B[i]) = Hi and Lo registers
mflo	$t8					  # copy Lo to temp8
sw    $t8 0($t3)    # Save temp8 to A[i]

addi	$s0, $s0, 1			# i = i + 1
j		Loop				    # jump to Loop
Exit: ...
