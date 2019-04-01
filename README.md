# rpi_gpio_test

simple framework to run or debug bare metal assembly codes with support of GPIO and System Timer.

## Usage

Put the code into `led.s`.

Run:
```shell
make
make run
```

Debug (gdb):
```shell
make
make debug
```
## Example

```
/* led.s */
.section .init
.global _start
_start:

ldr r0, =0x3F200000 /* GPIO */

mov r1, #1
lsl r1, #27
str r1, [r0, #8]

mov r1, #1
lsl r1, #29
str r1, [r0, #28]

loop:
b loop
```
