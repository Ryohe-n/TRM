# 31 :0 0xd9ba0e GAIN_ATTACK_TC:

- Attack Time Constant for gain smoothing (different for each
band) (1 - exp((-1.0 * BufferSize) / (Fs * GAINattackTC))). default: 14268942 (0.1sec @ 48 kHz with 32 BufferSize) (Q1.31 format) positive value only. Defining them as negative values will result in incorrect results.
- MBDRC_GAINRELEASE_0
This is an array of three identical register entries; the register fields below apply to each entry.
- Offset: 0xe0,..,0xe8
- Read/Write: RW
- Parity Protection: N
- Reset: 0x3e48590c (0b0011,1110,0100,1000,0101,1001,0000,1100)
- Bit
- Reset
- Description

