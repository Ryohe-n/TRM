# 0 = BYPASS : 1 = ACTIVE

- PEQ_AHUBRAMCTL_PEQ_CTRL_0
- Offset: 0x10
- Read/Write: See table below
- Parity Protection: N
- Reset: 0x00004000 (0b0xxx,xxxx,0000,0000,x100,xxx0,0000,0000)
- Bit
R/W
- Reset
- Description
- RO
- DONE
READ_BUSY: 0 = DONE 1 = BUSY 23:16
- RW
0x0
- SEQ_READ_COUNT
- RW
- WRITE
RW: 0 = READ 1 = WRITE
- RW
- DISABLE
ADDR_INIT_EN: 0 = DISABLE 1 = ENABLE
- RW
- DISABLE
SEQ_ACCESS_EN: 0 = DISABLE 1 = ENABLE 8:0
- RW
0x0
- RAM_ADDR
- PEQ_AHUBRAMCTL_PEQ_DATA_0
- Offset: 0x14
- Read/Write: RW

- Parametric Equalizer (PEQ) Control Registers
- Parity Protection: N
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

