#Greatest common divisor (GCD)
#GCD(9,6)
movi r10, 9
movi r11, 6
call gcd
halt

gcd:
mov r0, r10
movi r2, 0
cmpeq r0,r2
bf while
mov r10, r11
jmp r15

while:
cmpne r11,r1
bf end
cmpgt r0,r11
bf else
subu r0,r11
br while
else:
subu r11,r0
br while

end:
# Result: r0=3
jmp r15
