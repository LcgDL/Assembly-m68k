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
    #?(r2[6]!=r10[0])
cmpne r2,r10
bf end
   #r9=12
    #r9=6
mov r9,r2
   # r9=0 (12=1100 => ...1 => 0 AND 1 = 0)
    # r9=0 (6=0110 => ...1 => 0 AND 1 = 0)
andi r9,1
   #?(r9[0]==r10[0])
    #?(r9[0]==r10[0])
cmpeq r9,r10
bf else
   #r1= 20 => 10 * 2^1
    #r1= 40 => 20 * 2^1
lsli r1,1
   #r2= 6  => 12 / 2^1
lsri r2,1
br while

else:
addu r0,r1
lsli r1,1
lsri r2,1
br while

end:
br continue
