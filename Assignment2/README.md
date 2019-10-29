# COMP 303 Assignment 2 (Insertion Sort Using MIPS Assembly)

A MIPS Assembly program that sorts an array using the insertion sort algorithm, removes the duplicates (if there are any) from that array, and finally sums over all elements of the resulting array was implemented for this project. Length and elements of the array are taken as inputs from the user.

## Taking Inputs from the User

Inputs are taken from the user by a certain syntax. 

In order to define the length of the array, the user should enter
```bash
-n 10
``` 
to the command line.

This value is then parsed character by character, checking for the correct syntax. If any error is faced, an error message indicating that there is an error in the provided arguments is displayed.

Parts of the arguments that correspond to the array size are extracted by first checking if they are indeed numerical values; if they're not, an argument error is displayed again. It is cautiously determined whether the provided array length has multiple digits, and the given integer values are parsed accordingly (taking into account which digits they correspond to).

After the given arguments are validated and the size argument is extracted, it's value is contained in the $s1 register. The user is then prompted to enter integers in the amount provided before. The initial address of the array is stored in the $s0 register. Thus, starting from this register, each element's address will be stored in consecquent addresses.

An example input will be as follows.
```bash
Input integers
1
2
2
7
3
-5
98
1
34
-49
``` 
