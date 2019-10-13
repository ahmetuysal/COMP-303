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
addi	$t0, $zero, 0			    # temp0 = 0 + 0, keeps current iteration number

Loop: beq		$t0, $s1, Exit	# if temp0 (current iteration) == CNT jump to Exit

lh		$t2, 0($s2)		        # Load half-word (2 bytes) of SRC to temp2 
sh		$t2, 0($s3)		        # Save temp2 half-word to DST (saves 2 bytes)
addi	$s2, $s2, 2			      # SRC = SRC + 2
addi	$s3, $s3, 2			      # DST = DST + 2
addi	$t0, $t0, 1			      # temp0++, increment iteration counter by 1

j Loop
Exit: ...

# *Idea 2: Move two short integers at each iteration

# Use a register to store current iteration
addi	$t0, $zero, 0			    # temp0 = 0 + 0, keeps current iteration number
# Need to use >= as it it can get CNT + 1 since we are incrementing by 2
Loop: bge		$t0, $s1, Exit	# if temp0 (current iteration) >= CNT then jump to Exit

lw		$t2, 0($s2)		        # Load 4 bytes of SRC to temp2 
sw		$t2, 0($s3)		        # Save temp2 to DST
addi	$s2, $s2, 4			      # SRC = SRC + 4
addi	$s3, $s3, 4			      # DST = DST + 4
addi	$t0, $t0, 2			      # temp0 = temp0 + 2, increment iteration counter by 2

j Loop
Exit: ...

