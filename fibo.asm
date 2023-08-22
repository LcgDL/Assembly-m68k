# Calling 'fib' with r8=6
   # Solution r8=8
movi r8,6
   #call:0 #return next to this call: halt #jmp r15
   #call saves its own address + 2
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
     #4=1 F
      #3=1 F
       #2=1 F
        #1=1 T  
cmpeq r8, r1
bt sonst
   #6=2 F
    #5=2 F
     #4=2 F
      #3=2 F
       #2=2 T
cmpeq r8, r2
bt sonst 

# Push - Return address
   #r14=65533
    #r14=65529
     #r14=65525
      #r14=65521
subi r14, 2
   #r15-Addr -> r14[MEM-65533]=4
    #r15-Addr -> r14[MEM-65529]=34
     #r15-Addr -> r14[MEM-65525]=34
      #r15-Addr -> r14[MEM-65521]=34
stw r15, r14, 0
   #r14=65531
    #r14=65527
     #r14=65523
      #r14=65519
subi r14, 2
   #r8-Wert -> r14[MEM-65531]=6
    #r8-Wert -> r14[MEM-65527]=5
     #r8-Wert -> r14[MEM-65523]=4
      #r8-Wert -> r14[MEM-65519]=3
stw r8, r14, 0
   # r8=5 : call (n-1)
    # r8=4 : call (n-1)
     # r8=3 : call (n-1)
      # r8=2 : call (n-1)
subi r8, 1
   #call:1 #return next to this call: mov r5, r8 #jmp r15
    #call:2 #return next to this call: mov r5, r8 #jmp r15
     #call:3 #return next to this call: mov r5, r8 #jmp r15
      #call:4 #return next to this call: mov r5, r8 #jmp r15
call if

# temporarily save: cache #from jmp r15: sonst
   # r5=1
mov r5, r8
# write top value of r14 back to r8
   #r8=3 # r14-MEM[65519] = 3
ldw r8, r14, 0
# ??? Write buffer (r15) to r14
   #r14=65517
subi r14, 2
   #r5-Wert -> r14[MEM-65517]=1
stw r5, r14, 0

#call (n-2)
   #r8=1
subi r8, 2
   #call:5 #return next to this call: mov r4, r8 #jmp r15:sonst
call if

# r8 temporarily save: cache #from jmp r15
   #r4=1
mov r4, r8

# Load value in r5
   #r5=1
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
   # r8=1
    # r8=1
movi r8, 1
   #call:4 (after: (n-1) call if) #r15-Addr -> mov r5, r8 - 34 (Addrese in m68k editor)
    #call:5 (after: (n-2) call if) #r15-Addr -> mov r4, r8 - 46
jmp r15 
