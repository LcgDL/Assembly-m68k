
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
         #2=1 F
          #3=1 F
           #2=1 F
            #1=1 T
             #1=4 F
              #1=3 F
cmpeq r8, r1
bt sonst
   #6=2 F
    #5=2 F
     #4=2 F
      #3=2 F
       #2=2 T
        # 2=2 T
         # 3=2 F
          # 2=2 T
           # 4=2 F
            # 3=2 F
cmpeq r8, r2
bt sonst 

# Push - Return address
   #r14=65533
    #r14=65529
     #r14=65525
      #r14=65521
       #r14=65523
        #r14=65527
         #r14=65523
subi r14, 2
   #r15-Addr -> r14[MEM-65533]=4
    #r15-Addr -> r14[MEM-65529]=34
     #r15-Addr -> r14[MEM-65525]=34
      #r15-Addr -> r14[MEM-65521]=34
       #r15-Addr -> r14[MEM-65523]=46
        #r15-Addr -> r14[MEM-65527]=46
         #r15-Addr -> r14[MEM-65523]=34
stw r15, r14, 0
   #r14=65531
    #r14=65527
     #r14=65523
      #r14=65519
       #r14=65521
        #r14=65525
         #r14=65523
subi r14, 2
   #r8-Wert -> r14[MEM-65531]=6
    #r8-Wert -> r14[MEM-65527]=5
     #r8-Wert -> r14[MEM-65523]=4
      #r8-Wert -> r14[MEM-65519]=3
       #r8-Wert -> r14[MEM-65521]=3
        #r8-Wert -> r14[MEM-65525]=4
         #r8-Wert -> r14[MEM-65523]=34
stw r8, r14, 0
   # r8=5 : call (n-1)
    # r8=4 : call (n-1)
     # r8=3 : call (n-1)
      # r8=2 : call (n-1)
       # r8=2 : call (n-1)
        # r8=3 : call (n-1)
         ###
subi r8, 1
   #call:1 #return next to this call: mov r5, r8 #jmp r15
    #call:2 #return next to this call: mov r5, r8 #jmp r15
     #call:3 #return next to this call: mov r5, r8 #jmp r15
      #call:4 #return next to this call: mov r5, r8 #jmp r15
       #call:7 #return next to this call: mov r5, r8 #jmp r15
        #call:7 #return next to this call: mov r5, r8 #jmp r15
call if

# temporarily save: cache #from jmp r15: sonst
   # r5=1
    # r5=2
     # r5=3
      # r5=1
       #  r5=5
mov r5, r8
# write top value of r14 back to r8
   #r8=3 # r14-MEM[65519] = 3
    #r8=4
     #r8=5
      #r8=3
       # r8=6
ldw r8, r14, 0
# Write buffer (r15) to r14
   #r14=65517
    #r14=65521
     #r14=65525
      #r14=65519
       #r14=65529
subi r14, 2
   #r5-Wert -> r14[MEM-65517]=1
    # r14[]=2
     # r14[]=3
      # r14[]=1 
       # 14[]=5
stw r5, r14, 0

#call (n-2)
   #r8=1
    #r8=2
     #r8=3
      #r8=1
       #r8=4
subi r8, 2
   #call:5 #return next to this call: mov r4, r8 #jmp r15:sonst
    #call:6 #to cmpeq r8,r1
     #to cmpeq r8,r1
      #to cmpeq r8,r1
       #to cmpeq r8,r1
call if

# r8 temporarily save: cache #from jmp r15
   #r4=1
    #r4=1
     #r4=1
     #r4=2
mov r4, r8
# Load value in r5
   #r5=1
    #r5=2
     #r5=1
      #r5=3
ldw r5, r14, 0
   #r14[MEM-65519]=3
    #r14=65523
     #r14=65521
      #r14=655227
addi r14, 2
   #r8=3
    #r8=4
    #r8=3
     #r8=5
ldw r8, r14, 0
   #r14[MEM-65521]=34
    #r14=65525
     #r14=65523
      #r14=65529
addi r14, 2
# pop
   #r15=34
    #r15=34
     #r15=46
      #r15=34
ldw r15, r14, 0
   #r14[MEM-65523]=4
    #r14=65527
     #r14=65525
      #r14=65531
addi r14, 2
# Write value back to r8
   #r8=1
    #r8=2
     #r8=1
      #r8=3
mov r8, r5
# Result = a+b
   #r8=2
    #r8=3
     #r8=2
      #r8=5
addu r8, r4
   #call:3 (after: (n-1) call if) #r15-Addr -> mov r5, r8 - 34
    #call:5
     #call:8
      #call:9
jmp r15

sonst:
   # r8=1
    # r8=1
     # r8=1
      # r8=1
       # r8=1
movi r8, 1
   #call:1 (after: (n-1) call if) #r15-Addr -> mov r5, r8 - 34 (Addrese in m68k editor)
    #call:2 (after: (n-2) call if) #r15-Addr -> mov r4, r8 - 46
     #call:4 (after: (n-2) call if) #r15-Addr -> mov r4, r8 - 46
      #call:6
      #call:7
jmp r15 
