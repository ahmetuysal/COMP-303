#####################################################################
#                                                                   #
# Name: Ahmet Uysal - Furkan Sahbaz                                 #
# KUSIS ID: 60780 - 60124                                           #
#####################################################################

# This file serves as a template for creating 
# your MIPS assembly code for assignment 2

.eqv MAX_LEN_BYTES 400

#====================================================================
# Variable definitions
#====================================================================


.data

arg_err_msg:       .asciiz   "Argument error"
input_msg:         .asciiz   "Input integers\n"
input_msg_sl: 	   .asciiz   "Sorted list\n"
input_msg_rsl: 	   .asciiz   "Sorted list without duplicates\n"
input_msg_sum:     .asciiz   "List sum\n"
input_data:        .align    2   # Align on word boundary
		   .space    MAX_LEN_BYTES #Define length of input list
		    	    
#  You can define other data as per your need. 
arg_space:         .space    1024

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
   # Will point to the array address  
   la $s0, input_data
   # In order to read a string input from the user
   li $v0, 8 
   la $a0, input_data
   li $a1, 8
   syscall
   # Loading the first byte from input
   lb $t0, 0($a0)
   li $t1, 45
   # Check for first character to be -
   bne $t0, $t1, Arg_Err
   # Loading the second byte from input
   lb $t0, 1($a0)
   li $t1, 110
   # Check for second character to be n
   bne $t0, $t1, Arg_Err
   # Loading the third byte from input
   lb $t0, 2($a0)
   li $t1, 32
   # Check for third character to be " "
   bne $t0, $t1, Arg_Err
   # Setting initial array length to 0, since the rest of the input will be added on this number
   li $s1, 0
   # Pointing at the fourth byte of input
   addi $t2, $a0, 3

parse_number_count:
   # Getting current digit
   lb $t0, 0($t2)

   # Check for string terminator \0
   beqz $t0, parse_number_count_exit
            
   # Check for newline character
   beq $t0, 10, parse_number_count_exit
            
   # Check for numeric char bounds
   blt $t0, 48, Arg_Err
   bgt $t0, 57, Arg_Err

   # Get numeric value of char
   addi $t0, $t0, -48
   
   # Update array length
   mul $s1, $s1, 10
   add $s1, $s1, $t0
   
   # Moving to the next digit
   addi $t2, $t2, 1
   j parse_number_count
   
parse_number_count_exit: 

Data_Input:
   # Get integrs from user as per value of n
   la $a0, input_msg    
   li $v0, 4		  
   syscall
   # Initially etting counter to zero
   li $t0, 0

   read_number:

   bge $t0, $s1, read_number_end

   li $v0, 5
   syscall
   # Positioning the element in the array
   sll $t1, $t0, 2
   add $t1, $t1, $s0
   # Storing the read value
   sw $v0, 0($t1)
   addi $t0, $t0, 1   

   j read_number

   read_number_end:

# Insertion sort begins here
sort_data:
      
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

   bge $s2, $s1, sort_data_end

   # Calculate memory address of index i
   sll $t0, $s2, 2
   add $t1, $t0, $s0


   # Load current element at index i
   lw $s3 0($t1)

   # Set j = i-1
   addi $t2, $s2, -1

inner_loop:

   # Calculate memory address of index j
   sll $t3, $t2, 2
   add $t4, $t3, $s0
   # Load current element at index i
   lw $s4, 0($t4)

   # Jump to next i index if arr[i] already >= arr[j] (no need for swaps)
   bge $s3, $s4, aux_loop

   # Swapping elements
   sw $s3, 0($t4)
   sw $s4, 4($t4)

   # Jump to next i index if j = 0 
   beqz $t2, aux_loop

   addi $t2, $t2, -1

   j inner_loop
                  
sort_data_end:
   # Printing sorted list with duplicates
   la $a0, input_msg_sl      
   li $v0, 4		  
   syscall
   j print_w_dup

remove_duplicates:
   li $s2, -1

remove_loop:
   addi $s2, $s2, 1
# Need to take care of the list order after removal
remove_loop_after_index_inc:
   # Pointing at the next element
   sll $t0, $s2, 2 
   add $t0, $t0, $s0
   # Checking the current element and the next one 
   lw $s3, 0($t0)
   lw $s4, 4($t0)
   # Continue if these 2 elements are not the same
   bne $s3, $s4, remove_loop

   addi $t1, $s2, 0

remove_inner_loop:
   
   # Swapping until the end of the array, and then removing the last element by making the array shorter

   sll $t0, $t1, 2
   add $t0, $t0, $s0

   lw $t2 4($t0)
   sw $t2, 0($t0)

   addi $t1, $t1, 1

   blt $t1, $s1, remove_inner_loop
   # Cutting the length of the arrat
   addi $s1, $s1, -1
   # Taking care of the shortened array
   blt $s2, $s1 remove_loop_after_index_inc

   # Increment array size by one since it is decremented by an additional time 
   addi $s1, $s1, 1
                                                                       
   # Print sorted list without duplicates
   la $a0, input_msg_rsl       
   li $v0, 4		   
   syscall
   j print_wo_dup

print_w_dup:
   # Will be printing integers
   li $v0, 1
   li $t0, 0
     
print_loop:   

   bge $t0, $s1, print_loop_end

   # Looping through the array and printing the content
   sll $t1, $t0, 2

   add $t1, $t1, $s0
   lw $t1, 0($t1)
   add $a0, $t1, $zero

   li $v0, 1
   syscall
   # Spacing between printed integers
   li $v0, 11
   li $a0, 32
   syscall

   addi $t0, $t0, 1

   j print_loop

print_loop_end:
   # New line after the whole array has been printed   
   li $v0, 11
   li $a0, 10
   syscall


j remove_duplicates
                
print_wo_dup:

   li $t0, 0
  
print_wo_loop:   
   
   bge $t0, $s1, print_wo_dup_end
   
   # Looping through the duplicates-removed array and printing the content
   sll $t1, $t0, 2

   add $t1, $t1, $s0
   lw $t1, 0($t1)
   add $a0, $t1, $zero
   li $v0, 1
   syscall
   # Spacing between printed integers
   li $v0, 11
   li $a0, 32
   syscall

   addi $t0, $t0, 1

   j print_wo_loop
   
print_wo_dup_end:
   # New line after the whole array has been printed 
   li $v0, 11
   li $a0, 10
   syscall

# Perform reduction
   li $t3, 0

# index for loop
   li $t0, 0

reduction_loop:
   # Looping through the array and summing its content
   
   bge $t0, $s1, reduction_end
   
   sll $t1, $t0, 2
   add $t1, $t1, $s0
   lw $t2, 0($t1)
   add $t3, $t3, $t2

   addi $t0, $t0, 1

    j reduction_loop

reduction_end:

   # Print sum
   la $a0, input_msg_sum      
   li $v0, 4		   
   syscall
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
