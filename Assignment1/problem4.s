# Implement short_int_CPY in MIPS

# This instruction copies short integers from one address to another. The instruction uses
# three registers: CNT (count), SRC (source), and DST (destination). The CNT indicates the
# number of iterations. Each iteration, the instruction moves a short integer (two bytes data)
# from memory at address SRC to memory at address DST, and then increments both address
# pointers by two bytes. Thus, the instruction copies in total 2*CNT many bytes from source
# to destination.

# Assume $s1 = CNT, $s2 = SRC, $s3 = DST

# *Idea 1: Move each short integer (2 bytes) separately

# Use a register to store current iteration
addi	$t0, $zero 0			    # temp0 = 0 + 0, keeps current iteration number
addi	$t1, $s1, -1			    # temp1 = CNT - 1, used in stop condition 
Loop: beq		$t0, $t1, Exit	# if temp0 (current iteration) == temp1 (no. iterations - 1) jump to Exit
lw		$t2, 0($s2)		        # Load 4 bytes of SRC to temp2 
sw		$t2, 0($s3)		        # Save temp2 to DST (saves 4 bytes, 2 bytes will be overriden at next iteration)
addi	$s2, $s2, 2			      # SRC = SRC + 2
addi	$s3, $s3, 2			      # DST = DST + 2
addi	$t0, $t0, 1			      # temp0++, increment iteration counter
j Loop
Exit: ...


