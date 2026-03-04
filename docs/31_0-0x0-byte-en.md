# 31 :0 0x0 BYTE_EN:

- Byte enables for bytes 32 to 63
- ADX_AHUBRAMCTL_ADX_CTRL_0
- Offset: 0xb8
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
- ADX_AHUBRAMCTL_ADX_DATA_0
- Offset: 0xbc
- Read/Write: R/W
- Parity Protection: N
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

