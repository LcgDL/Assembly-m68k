#Call-Stack 
fib:
# Stack Pointer
movi r14, 0
subi r14, 1
# Hilfsregister
movi r1, 1
movi r2, 2

wenn:
cmpeq r8, r1
bt sonst
cmpeq r8, r2
bt sonst 

# Push - Rucksprungadresse
subi r14, 2
stw r15, r14, 0
# r8-Wert in r14 schreiben
subi r14, 2
stw r8, r14, 0
# call (n-1)
subi r8, 1
call wenn

# r8 zwischenspeichern
mov r5, r8
# oberster Wert von r14 wieder in r8 schreiben
ldw r8, r14, 0
# ??? Zwischenspeichern (r15) in r14 schreiben
subi r14, 2
stw r5, r14, 0

#call (n-2)
subi r8, 2
call wenn

# r8 zwischenspeichern
mov r4, r8

# ??? Wert in r5 laden
ldw r5, r14, 0
addi r14, 2
# ???
ldw r8, r14, 0
addi r14, 2
# pop
ldw r15, r14, 0
addi r14, 2
# Wert wieder in r8 schreiben
mov r8, r5
# ergebnis= a+b
addu r8, r4
jmp r15

sonst:
movi r8, 1
jmp r15 
