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
input_data:        .space    MAX_LEN_BYTES     #Define length of input list
#  You can define other data as per your need. 


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
   

   # Check for first argument to be n
 
   

Data_Input:
   # Get integers from user as per value of n
   
   ##################  YOUR CODE  ####################   
   



# Insertion sort begins here
sort_data:

   ##################  YOUR CODE  ####################

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