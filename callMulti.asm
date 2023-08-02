   #Calculate: 10 * 12 + 5
movi r1,10
movi r2,12
movi r3,5
br mul

continue:
addu r0,r3
   # Result: r0=125
halt

mul:
   #Auxiliary registers
movi r0,0
movi r10,0

while:
   #?(r2[12]!=r10[0]) 
cmpne r2,r10
bf end
   #r9=12
mov r9,r2
   # r9=0 (12=1100 => ...1 => 0 AND 1 = 0)
andi r9,1
   #if
cmpeq r9,r10
bf else
lsli r1,1
lsri r2,1
br while

else:
addu r0,r1
lsli r1,1
lsri r2,1
br while

end:
br continue
