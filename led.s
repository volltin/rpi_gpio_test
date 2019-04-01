.section .init
.global _start
_start:

ldr r0, =0x3F200000

mov r1, #1
lsl r1, #27
str r1, [r0, #8]

mov r1, #1
lsl r1, #29
str r1, [r0, #28]

loop:
b loop
