.def TERM_CHAR_OUT 0xa0000000

.org 0x80000000

.init:
    b ._main

.term_puts:
    .load32 %gp0 .TERM_CHAR_OUT

.loop:
    l       %gp1, %a0+(%r0*0)
    cmpz    %gp1
    beq     .end
    sb      %gp0, %gp1
    inc     %a0
    b       .loop

.end:
    rtl

._main:
    .load32 %a0 .HELLO_WORLD
    .load32 %gp0 !term_puts
    jal     %gp0

.I: b .I

.defs HELLO_WORLD "Hello, world!\0"