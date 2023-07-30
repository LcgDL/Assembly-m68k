#SET NUMBERS IN MEMORY
#00 02
   #r9=1
movi r9, 1 
   #1*2^8 => r9=256
lsli r9, 8   
movi r8, 2
   #r9:MEM[256] = 2 
   #256-deci = 100-hex (MEM): 0x0100: 0002 
   #(16 bit Group: 8bits-Adresse[256:00] _ 8bits-Value=02)
stw r8,r9
   #r5=2 <- MEM[256] = 2
ldw r5,r9

#00 0e
   #r7=1
movi r7, 1
   #1*2^8 => r7=256
lsli r7, 8
   #r7+2 => 258
addi r7,2
movi r6, 14
   #258-deci = 102-hex (MEM): 0x0102: 0000 000e
   #(16 bit Group: 8bits-Adresse[258:00] _ 8bits-Value=0e)
stw r6,r7

#00 1f = 31
movi r10, 1
   #1*2^8 => r10=256
lsli r10, 8
   #r10=260
addi r10, 4
movi r5, 1
   #1*2^5 => r5=32
lsli r5, 5
   #r5=31
subi r5, 1
   #260-deci = 104-hex (MEM): 0x0100: 0000 0000 001f
   #(16 bit Group: 8bits-Adresse[260:00] _ 8bits-Value=1f)
stw r5,r10

#Execution
   #r0=1
movi r0, 1
   #1*2^8 => r0=256
lsli r0, 8
   #r1=0 ; r2=0
movi r1, 0
movi r2, 0
   # r3=0 <- MEM[256] = 0
     # movi r9,9 
     # stw r9,r0
ldw r3, r0

loop:
   #?(r3[2]==r1[0])
cmpeq r3, r1
bt end

   #r0=258
addi r0, 2
ldw r4, r0
subi r3, 1
addu r2, r4
br loop

end:
mov r4, r2
bseti r2, 0
subu r2, r4
halt
