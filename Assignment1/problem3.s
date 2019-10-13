# X = Y + Z; -> Y + Z
# Y = X + Z; -> Y + 2 * Z
# T = X - Y; -> -Z

# 0-address machine implementation
# Stack is represented as [ , , , <- PUSH&POP here
# Assumed initial memory [X, Y, Z, T
# $t7 is as dummy address for removing values from stack
POP $t7   # remove T from stack, memory: [X, Y, Z
POP $t0   # save Z to temp0, memory: [X, Y
PUSH $t0  # push Z back to stack, memory: [X, Y, Z
ADD $t1   # save X = Y + Z to temp1, memory: [X
POP $t7   # remove old X from stack, memory: [
PUSH $t1  # push X (Y + Z) to stack, memory: [X
PUSH $t0  # push Z to stack, memory [X, Z
ADD $t2   # save Y = X + Z to temp2, memory: [
PUSH $t1  # push X to stack, memory: [X
PUSH $t2  # push Y to stack, memory: [X, Y
SUB $t3   # save T = X - Y to temp3, memory: [
PUSH $t1  # push X to stack, memory: [X
PUSH $t2  # push Y to stack, memory: [X, Y 
PUSH $t0  # push Z to stack, memory: [X, Y, Z
PUSH $t3  # push T to stack, memory: [X, Y, Z, T