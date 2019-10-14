# X = Y + Z;
# Y = X + Z;
# T = X - Y;

# 0-address machine implementation
# Stack is represented as [ , , , <- PUSH&POP here
# Assumed X, Y, Z, T stored in $s0, $s1, $s2, $s3, respectively

PUSH  $s1   # Push Y to stack, Stack: [Y
PUSH  $s2   # Push Z to stack, Stack: [Y, Z
ADD         # Pop two values, push val1 + val2 back to stack, Stack: [X(Y + Z)
POP   $s0   # Pop X and save it back to $s0, Stack: [
PUSH  $s0   # Push X to stack, Stack: [X
PUSH  $s2   # Push Z to stack, Stack: [X, Z
ADD         # Pop two values, push val1 + val2 back to stack, Stack: [Y(X + Z)
POP   $s1   # Pop Y and save it back to $s1, Stack: [
PUSH  $s0   # Push X to stack, Stack: [X
PUSH  $s1   # Push Y to stack, Stack: [X, Y
SUB         # Pop two values, push val1 - val2 back to stack, Stack: [T(X - Y)
POP   $s3   # Pop Z and save it back to $s3, Stack: [

# MIPS implementation
# Assumed addresses of X, Y, Z, T are stored in $s0, $s1, $s2, $s3, respectively
lw		$t1, 0($s1)		  # Load value of Y to temp1
lw		$t2, 0($s2)		  # Load value of Z to temp2
add		$t0, $t1, $t2		# X = Y + Z
sw		$t0, 0($s0)		  # Save updated value of X 
add		$t1, $t0, $t2		# Y = X + Z
sw		$t1, 0($s1)		  # Save updated value of Y
sub		$t3, $t0, $t1		# T = X - Y
sw    $t3, 0($s3)     # Save updated value of T