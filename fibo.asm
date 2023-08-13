# Calling 'fib' with r8=6
   # Solution r8=8
movi r8,6
call fib
halt

# Call-Stack 
fib:
# Stack Pointer
   #r14=65535 
movi r14, 0
subi r14, 1
# Help registers
movi r1, 1
movi r2, 2

if:
   #6=1 F
    #5=1 F
cmpeq r8, r1
bt sonst
   #6=2 F
    #5=2 F
cmpeq r8, r2
bt sonst 

# Push - Return address
   #r14=65533
subi r14, 2
   #r15-Addr -> r14[MEM]
stw r15, r14, 0
   #r14=65531
subi r14, 2
   #r8-Wert -> r14[MEM]
stw r8, r14, 0
   # call (n-1) : r8=5
subi r8, 1
call if

# r8? temporarily save: cache
mov r5, r8
# write top value of r14 back to r8
ldw r8, r14, 0
# ??? Write buffer (r15) to r14
subi r14, 2
stw r5, r14, 0

#call (n-2)
subi r8, 2
call if

# r8? temporarily save: cache
mov r4, r8

# ??? Load value in r5
ldw r5, r14, 0
addi r14, 2
# ???
ldw r8, r14, 0
addi r14, 2
# pop
ldw r15, r14, 0
addi r14, 2
# Write value back to r8
mov r8, r5
# Result = a+b
addu r8, r4
jmp r15

sonst:
movi r8, 1
jmp r15 
