.def TERM_CHAR_OUT  0xa0000000
.def FLASH_ENTRY    0x90000000
.def USER_ENTRY     0x90000004
.def BOOT_SIGNATURE 0x4d425948

.org 0x80000000

.begin:
    b ._main

.debug:
    .load32 %a0 .DEBUG_START
    jal     !puts

    .load32 %a0 .DEBUG_R0
    jal     !puts
    l       %a0, %r0
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_GP0
    jal     !puts
    l       %a0, %gp0
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_GP1
    jal     !puts
    l       %a0, %gp1
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_GP2
    jal     !puts
    l       %a0, %gp2
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_GP3
    jal     !puts
    l       %a0, %gp3
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_GP4
    jal     !puts
    l       %a0, %gp4
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_GP5
    jal     !puts
    l       %a0, %gp5
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_GP6
    jal     !puts
    l       %a0, %gp6
    jal     !print_hex
    .load32 %a0 .DEBUG_NL
    jal     !puts

    .load32 %a0 .DEBUG_GP7
    jal     !puts
    l       %a0, %gp7
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_GP8
    jal     !puts
    l       %a0, %gp8
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_GP9
    jal     !puts
    l       %a0, %gp9
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_GP10
    jal     !puts
    l       %a0, %gp10
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_GP11
    jal     !puts
    l       %a0, %gp11
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_GP12
    jal     !puts
    l       %a0, %gp12
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_GP13
    jal     !puts
    l       %a0, %gp13
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_GP14
    jal     !puts
    l       %a0, %gp14
    jal     !print_hex
    .load32 %a0 .DEBUG_NL
    jal     !puts

    .load32 %a0 .DEBUG_A0
    jal     !puts
    l       %a0, %a0
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_A1
    jal     !puts
    l       %a0, %a1
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_A2
    jal     !puts
    l       %a0, %a2
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_RR0
    jal     !puts
    l       %a0, %rr0
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_A3
    jal     !puts
    l       %a0, %a3
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_A4
    jal     !puts
    l       %a0, %a4
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_A5
    jal     !puts
    l       %a0, %a5
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_RR1
    jal     !puts
    l       %a0, %rr1
    jal     !print_hex
    .load32 %a0 .DEBUG_NL
    jal     !puts

    .load32 %a0 .DEBUG_LR0
    jal     !puts
    l       %a0, %lr0
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_LR1
    jal     !puts
    l       %a0, %lr1
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_LR2
    jal     !puts
    l       %a0, %lr2
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_LR3
    jal     !puts
    l       %a0, %lr3
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_IR
    jal     !puts
    l       %a0, %ir
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_BR
    jal     !puts
    l       %a0, %br
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_SP
    jal     !puts
    l       %a0, %sp
    jal     !print_hex
    .load32 %a0 .DEBUG_NNL
    jal     !puts

    .load32 %a0 .DEBUG_PC
    jal     !puts
    l       %a0, %pc
    jal     !print_hex
    .load32 %a0 .DEBUG_NL
    jal     !puts
.A: b .A

.print_hex:
    .load32 %gp1 .TERM_CHAR_OUT
    l       %gp2, 0x8
    lui     %gp3, 0xf000
    l       %gp4, 28

.print_hex_loop:
    and     %gp0, %a0, %gp3
    sar     %gp0, %gp4
    sub     %gp4, %gp4, 4
    cmp     %gp0, 0xa
    beq     .print_hex_h
    bpl     .print_hex_h
    add     %gp0, %gp0, 0x30
    b       .print_hex_char_out

.print_hex_h:
    sub     %gp0, %gp0, 0xa
    add     %gp0, %gp0, 0x61

.print_hex_char_out:
    sb      %gp1, %gp0
    sar     %gp3, 4
    dec     %gp2
    bne     .print_hex_loop

.print_hex_end:
    rtl

.strlen:
    l       %gp1, %a0+%r0*0
    and     %gp1, 0xff
    beq     .strlen_end
    inc     %rr0
    inc     %a0
    b       .strlen

.strlen_end:
    rtl

.puts:
    .load32 %gp0 .TERM_CHAR_OUT

.puts_loop:
    l       %gp1, %a0+(%r0*0)
    and     %gp1, 0xff
    beq     .puts_end
    sb      %gp0, %gp1
    inc     %a0
    b       .puts_loop

.puts_end:
    rst     %rr0
    rtl

._main:
    .load32 %a0 .COPYRIGHT_STRING
    jal     !puts

    .load32 %a0 .EXECT_NOTICE_READING_SIGNATURE
    jal     !puts

    .load32 %gp0 .FLASH_ENTRY

.check_signature:
    l       %gp1, %gp0+%r0*0
    .load32 %gp2 .BOOT_SIGNATURE
    cmp     %gp1, %gp2
    bne     .no_signature
    add     %gp0, %gp0, 4

    .load32 %a0 .EXECT_NOTICE_STRING
    jal     !puts

    .load32 %a0 .USER_ENTRY
    jal     !puts

    .load32 %a0 .EXECT_NOTICE_DEVICE_ADDR
    jal     !puts

    .load32 %gp0 .USER_ENTRY

.search_entry:
    l       %gp1, %gp0+%r0*0
    and     %gp1, %gp1, 0xff
    beq     .transfer
    inc     %gp0
    b       .search_entry

.transfer:
    inc     %gp0
    l       %a0, %gp0
    l       %gp14, %gp0
    jal     !print_hex

    .load32 %a0 .EXECT_NOTICE_END
    jal     !puts

    j       %gp14

.no_signature:
    .load32 %a0 .ERROR_NO_SIGNATURE
    jal     !puts
    .load32 %a0 .DEBUG_NL
    jal     !puts
    j       !debug

.I: b .I

.defs COPYRIGHT_STRING "HyBIOS v0.1 Copyright (C) 2022 Lisandro Alarcon\n\n\0"
.defs EXECT_NOTICE_STRING "Transferring execution to \0"
.defs EXECT_NOTICE_DEVICE_ADDR " in flash device @ 0x\0"
.defs EXECT_NOTICE_END ".\n\n\0"
.defs EXECT_NOTICE_READING_SIGNATURE "Reading signature from boot device...\n\0"
.defs ERROR_NO_SIGNATURE "Couldn't find a bootable medium. System halted.\n\0"
.defs DEBUG_START "Looks like this CPU crashed! Here are some registers:\n\0"
.defs DEBUG_R0   "R0  : \0"
.defs DEBUG_GP0  "GP0 : \0"
.defs DEBUG_GP1  "GP1 : \0"
.defs DEBUG_GP2  "GP2 : \0"
.defs DEBUG_GP3  "GP3 : \0"
.defs DEBUG_GP4  "GP4 : \0"
.defs DEBUG_GP5  "GP5 : \0"
.defs DEBUG_GP6  "GP6 : \0"
.defs DEBUG_GP7  "GP7 : \0"
.defs DEBUG_GP8  "GP8 : \0"
.defs DEBUG_GP9  "GP9 : \0"
.defs DEBUG_GP10 "GP10: \0"
.defs DEBUG_GP11 "GP11: \0"
.defs DEBUG_GP12 "GP12: \0"
.defs DEBUG_GP13 "GP13: \0"
.defs DEBUG_GP14 "GP14: \0"
.defs DEBUG_A0   "A0  : \0"
.defs DEBUG_A1   "A1  : \0"
.defs DEBUG_A2   "A2  : \0"
.defs DEBUG_RR0  "RR0 : \0"
.defs DEBUG_A3   "A3  : \0"
.defs DEBUG_A4   "A4  : \0"
.defs DEBUG_A5   "A5  : \0"
.defs DEBUG_RR1  "RR1 : \0"
.defs DEBUG_LR0  "LR0 : \0"
.defs DEBUG_LR1  "LR1 : \0"
.defs DEBUG_LR2  "LR2 : \0"
.defs DEBUG_LR3  "LR3 : \0"
.defs DEBUG_IR   "IR  : \0"
.defs DEBUG_BR   "BR  : \0"
.defs DEBUG_SP   "SP  : \0"
.defs DEBUG_PC   "PC  : \0"
.defs DEBUG_NNL ", \0"
.defs DEBUG_NL "\n\0"