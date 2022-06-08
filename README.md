# hyrisc-as
An assembler for the Hyrisc architecture

## Preprocessor directives
All directives need to be preceded by a `.`:
- `org`: Set the origin of the binary
- `def`: Define a symbol
- `defs`: Define a string
- `undef`: Undefine a symbol
- `load32`: Fully load any register with a 32-bit value
- `blob`: Append a binary blob of data from a file
- `pad`: Append bytes of the specified value until the specified address is reached


## Labels
It's possible to define labels by putting a `:` immediately after a name, like this:
```
.my_label:
```

There are two ways of using labels, either as relative, or absolute addresses.

### Relative
```
beq .my_label
```

In relative mode, the assembler will calculate the difference between the current position and the label.

### Absolute
```
jal !my_label
```

In absolute mode, the assembler will return the absolute 32-bit address of the label.

In the example above, the full 32-bit value is truncated to 16 bits, so jumps like that will only work within equal 64 KiB blocks of memory

i.e. a jump from `80000000` to `80010000` won't work with an absolute address on a label.

The subroutine's address would need to be loaded onto a register, and then using `jal`'s register addressing mode:

```
.load32 a0 !my_label
jal a0
```
