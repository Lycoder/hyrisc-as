.def TERM_CHAR_OUT 0xa0000000
.def TERM_CHAR_IN  0xa0000001
.def MEMORY_BASE   0x10000000
.def COMMAND_SIZE  0x10000000
.def COMMAND_BUF   0x10000002

.org 0x90000000

.defs HYBIOS_BOOT_SIGNATURE "HYBM"
.defs HYOS_PROGRAM_ID "HyOS\0"

.init:
    b ._main

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
    rst     %rr0

.strlen_loop:
    l       %gp1, %a0+%r0*0
    and     %gp1, %gp1, 0xff
    beq     .strlen_end
    inc     %a0
    inc     %rr0
    b       .strlen_loop

.strlen_end:
    rtl

.strcmp:
    l       %a2, %a0
    l       %a3, %a1
    jal     !strlen
    l       %gp3, %rr0
    l       %a0, %a1
    jal     !strlen
    l       %gp4, %rr0
    cmp     %gp3, %gp4
    beq     .strcmp_leneq

.strcmp_noteq:
    rst     %rr0
    rtl

.strcmp_leneq:
    l       %a0, %a2
    l       %a1, %a3

.strcmp_loop:
    l       %gp0, %a0+%r0*0
    l       %gp1, %a1+%r0*0
    and     %gp0, %gp0, 0xff
    and     %gp1, %gp1, 0xff
    beq     .strcmp_eq
    cmp     %gp0, %gp1
    bne     .strcmp_noteq
    inc     %a0
    inc     %a1
    b       .strcmp_loop

.strcmp_eq:
    l       %rr0, 1
    rtl

.term_clear_line:
    .load32 %gp0 .TERM_CHAR_OUT
    l       %gp1, 80
    sb      %gp0, 0x0d

.term_clear_line_loop:
    sb      %gp0, 0x20
    dec     %gp1
    bne     .term_clear_line_loop
    sb      %gp0, 0x0d
    rtl

.term_get:
    .load32 %gp0 .TERM_CHAR_IN

.term_get_wait:
    l       %gp1, %gp0+%r0*0
    cmpz    %gp1
    beq     .term_get_wait

.term_get_end:
    l       %rr0, %gp1
    rtl

.term_put:
    .load32 %gp0 .TERM_CHAR_OUT
    sb      %gp0, %a0
    rtl

.term_puts:
    .load32 %gp0 .TERM_CHAR_OUT

.term_puts_loop:
    l       %gp1, %a0+(%r0*0)
    and     %gp1, 0xff
    beq     .term_puts_end
    sb      %gp0, %gp1
    inc     %a0
    b       .term_puts_loop

.term_puts_end:
    rtl

.command_clear:
    .load32 %gp0 .COMMAND_SIZE
    .load32 %gp1 .COMMAND_BUF
    l       %gp0, %gp0+%r0*0
    and     %gp0, %gp0, 0xffff
    add     %gp1, %gp1, %gp0
    .load32 %gp0 .COMMAND_SIZE

.command_clear_loop:
    sb      %gp0, 0x0
    inc     %gp0
    cmp     %gp1, %gp0
    bne     .command_clear_loop

.command_clear_end:
    .load32 %gp0 .COMMAND_SIZE
    sh      %gp0, 0x0
    rtl

.command_increment_size:
    .load32 %gp0 .COMMAND_SIZE
    l       %gp1, %gp0+%r0*0
    inc     %gp1
    and     %gp1, 0xffff
    sh      %gp0, %gp1
    rtl

.command_decrement_size:
    .load32 %gp0 .COMMAND_SIZE
    l       %gp1, %gp0+%r0*0
    dec     %gp1
    and     %gp1, 0xffff
    sh      %gp0, %gp1
    rtl

._main:
    .load32 %a0 .WELCOME
    jal     !term_puts

._main_prompt:
    jal     !term_clear_line

    .load32 %a0 .PROMPT
    jal     !term_puts

    .load32 %a0 .COMMAND_BUF
    jal     !term_puts

._main_wait:
    jal     !term_get
    l       %a0, %rr0

    cmp     %a0, 0x8
    beq     ._main_handle_del

    cmp     %a0, 0xd
    beq     ._main_handle_command

._main_put_buffer:
    .load32 %gp0 .COMMAND_SIZE
    l       %gp1, %gp0+%r0*0
    and     %gp1, 0xffff
    .load32 %gp0 .COMMAND_BUF
    addu    %gp0, %gp0, %gp1
    sb      %gp0, %a0
    jal     !command_increment_size
    b       ._main_prompt

._main_handle_del:
    .load32 %gp0 .COMMAND_SIZE
    l       %gp1, %gp0+%r0*0
    cmpz    %gp1
    beq     ._main_prompt
    jal     !command_decrement_size
    .load32 %gp0 .COMMAND_BUF
    addu    %gp0, %gp0, %gp1
    sb      %gp0, 0x0
    b       ._main_prompt

._main_handle_command:
    .load32 %a0 .COMMAND_HELP
    .load32 %a1 .COMMAND_BUF
    jal     !strcmp
    cmpz    %rr0
    bne     ._main_handle_help
    .load32 %a0 .COMMAND_VER
    .load32 %a1 .COMMAND_BUF
    jal     !strcmp
    cmpz    %rr0
    bne     ._main_handle_ver
    .load32 %a0 .COMMAND_DIR
    .load32 %a1 .COMMAND_BUF
    jal     !strcmp
    cmpz    %rr0
    bne     ._main_handle_dir

._main_command_not_found:
    l       %a0, 0xa
    jal     !term_put
    .load32 %a0 .COMMAND_NOT_FOUND
    jal     !term_puts
    .load32 %a0 .COMMAND_BUF
    jal     !term_puts

._main_handle_command_end:
    l       %a0, 0xa
    jal     !term_put
    jal     !term_put
    jal     !command_clear
    b       ._main_prompt

._main_handle_help:
    l       %a0, 0xa
    jal     !term_put
    .load32 %a0 .COMMAND_HELP_TEXT
    jal     !term_puts
    b       ._main_handle_command_end

._main_handle_ver:
    l       %a0, 0xa
    jal     !term_put
    .load32 %a0 .COMMAND_VER_TEXT
    jal     !term_puts
    b       ._main_handle_command_end

._main_handle_dir:
    l       %a0, 0xa
    jal     !term_put
    .load32 %a0 .COMMAND_DIR_TEXT
    jal     !term_puts
    b       ._main_handle_command_end

.I: b .I

.defs PROMPT "\r> \0"
.defs WELCOME "Welcome to HyOS! The first OS for Hyrisc CPUs.\n\n\0"
.defs COMMAND_VER_TEXT "HyOS Version 0.1 Alpha\0"
.defs COMMAND_DIR_TEXT "No drive detected\0"
.defs COMMAND_HELP "help\0"
.defs COMMAND_VER "ver\0"
.defs COMMAND_DIR "dir\0"
.defs COMMAND_PRINT "print\0"
.defs COMMAND_HELP_TEXT
    "help       - Shows a list of available commands
ver        - Displays the current version number
dir        - Displays a directory listing
print      - Prints a formatted string\0"
.defs COMMAND_NOT_FOUND "Couldn't find command \0"
.defs DEBUG_STR "Debug string\n\0"