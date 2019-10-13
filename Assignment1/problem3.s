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
# Assumed X, Y, Z, T stored in $s0, $s1, $s2, $s3, respectively
add		$s0, $s1, $s2		# X = Y + Z
add		$s1, $s0, $s2		# Y = X + Z
sub		$s3, $s0, $s1		# T = X - Y
