.global _start
_start:

ldr    r0, =gpiomem
ldr    r1, =0x101002   /* O_RDWR | O_SYNC */
mov    r7, #5          /* open */
svc    #0
mov    r4, r0          /* file descriptor */
      
ldr    r0, =0x3F200000 /* GPIO address */
mov    r1, #4096       /* map size */
mov    r2, #3          /* PROT_READ | PROT_WRITE */
mov    r3, #1          /* MAP_SHARED */
mov    r5, #0          /* offset */
mov    r7, #192        /* mmap2 */
svc    #0

ldr    r0, =mem
ldr    r1, =0x101002   /* O_RDWR | O_SYNC */
mov    r7, #5          /* open */
svc    #0
mov    r4, r0

ldr    r0, =0x3F003000 /* timer address */
mov    r1, #4096       /* map size */
mov    r2, #3          /* protection */
mov    r3, #1          /* shared */
ldr    r5, =0x3F003    /* offset */
mov    r7, #192        /* mmap2 */
svc    #0

/* user code start */

{user_code}

/* user code end */

.data
gpiomem: .asciz  "/dev/gpiomem"
mem:     .asciz  "/dev/mem"
