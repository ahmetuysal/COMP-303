#####################################################################
#                                                                   #
# Name: Ahmet Uysal                                                 #
# KUSIS ID: 60780                                                   #
#####################################################################

# This file serves as a template for creating 
# your MIPS assembly code for assignment 2

.eqv MAX_LEN_BYTES 400

#====================================================================
# Variable definitions
#====================================================================


.data

arg_err_msg:       .asciiz   "Argument error"
input_msg:         .asciiz   "Input integers"
input_data:        .align 2   # Align on word boundary
		    .space    MAX_LEN_BYTES #Define length of input list
		    	    
#  You can define other data as per your need. 
arg_space:         .space 1024

#==================================================================== 
# Program start
#====================================================================

.text
.globl main

main:
   #
   # Main program entry
   #
   #
   # Main body
   # 
   
   # Check for command line arguments count and validity
  
   la $s0, input_data
   addi $s0, $zero, 9
   
   # Load [8, 2, 4, 6, 11, 35, 12, -5, 2] in to memory
   
   li $t0 8
   sw $t0, 0($s0)

   li $t0 2
   sw $t0, 4($s0)
   
   li $t0 4
   sw $t0, 8($s0)
   
   li $t0 6
   sw $t0, 12($s0)
   
   li $t0 11
   sw $t0, 16($s0)
   
   li $t0 35
   sw $t0, 20($s0)
   
   li $t0 12
   sw $t0, 24($s0)
   
   li $t0 -5
   sw $t0, 28($s0)

   li $t0 2
   sw $t0, 32($s0)
   
   # Check for first argument to be n
 
   

Data_Input:
   # Get integers from user as per value of n
   
   ##################  YOUR CODE  ####################   
   



# Insertion sort begins here
sort_data:

   ##################  YOUR CODE  ####################
   
# s0 -> address of array
# s1 -> length of array
# s2 -> current index (i)
# s3 -> current element (i)
# s4 -> current element (j)
# t0 -> s2 * 4 (for word load)
# t1 -> address for element at i
# t2 -> current index (inner)
# t3 -> t2 * 4 (for word load)
# t4 -> address for element at j

addi $s2,$zero, 0

aux_loop: 
addi $s2, $s2, 1

beq $s2, $s1, sort_data_end

srl $t0, $s2, 2
add $t1, $t0, $s0
lw $s3 0($t1)
# addi $s2 $s2 1

addi $t2, $s2, -1
inner_loop:
srl $t3, $t2, 2
add $t4, $t3, $s0
lw $s4, 0($t4)

bge $s3, $s4, aux_loop

sw $s3, 0($t4)
sw $s4, 0($t1)

beqz $t2, aux_loop

addi $t2, $t2, -1

j inner_loop
   
               
sort_data_end:


remove_duplicates:
   
   ##################  YOUR CODE  ####################

# Print sorted list with and without duplicates



print_w_dup:

   ##################  YOUR CODE  ####################
   
print_wo_dup:

   ##################  YOUR CODE  ####################

# Perform reduction
   
   ##################  YOUR CODE  ####################

# Print sum
  li  $v0, 1
  addi $a0, $t3, 0      # $t3 contains the sum  
  syscall

   j Exit 
   
Arg_Err:
   # Error message when no input arguments specified
   # or when argument format is not valid
   la $a0, arg_err_msg
   li $v0, 4
   syscall
   j Exit

Exit:   
   # Jump to this label at the end of the program
   li $v0, 10
   syscall
