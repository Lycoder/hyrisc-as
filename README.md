# hyrisc-as
Hyrisc assembler

## Preprocessor commands
All commands are preceded by a `.`:
- `org`: Set the writer's current position
- `def`: Define a symbol
- `undef`: Undefine a symbol

It's possible to define labels by putting a `:` immediately after a name, like this:
```
.my_label:
```

The assembler will automatically calculate the difference between the current writer position and a label. e.g.:
```
.start:
  lui gp0, 2

.loop:
  dec gp0
  bne .loop

.end:
  b .start
```
