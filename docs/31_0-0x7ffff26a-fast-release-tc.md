# 31 :0 0x7ffff26a FAST_RELEASE_TC:

- Fast Release Time Constant for gain smoothing (different for
each band) (1 - exp((-1.0 * BufferSize) / (Fs * FastRelease))) default: 2147480170 (0.00005sec @ 48 kHz with 32
- BufferSize) (Q1.31 format)
positive value only. Defining them as negative values will result in incorrect results.
- MBDRC_AHUBRAMCTL_MBDRC_CTRL_0
This is an array of three identical register entries; the register fields below apply to each entry.
- Offset: 0xf8,..,0x100
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
- MBDRC_AHUBRAMCTL_MBDRC_DATA_0
This is an array of three identical register entries; the register fields below apply to each entry.
- Offset: 0x104,..,0x10c
- Read/Write: RW
- Parity Protection: N
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

