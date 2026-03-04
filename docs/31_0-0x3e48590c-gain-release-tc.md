# 31 :0 0x3e48590c GAIN_RELEASE_TC:

- Release Time Constant for gain smoothing (different for each
band) (1 - exp((-1.0 * BufferSize) / (Fs * GAINreleaseTC))) default: 1044928780 (0.001sec @ 48 kHz with 32 BufferSize) (Q1.31 format) positive value only. Defining them as negative values will result in incorrect results
- MBDRC_FASTRELEASE_0
This is an array of three identical register entries; the register fields below apply to each entry.
- Offset: 0xec,..,0xf4
- Read/Write: RW
- Parity Protection: N
- Reset: 0x7ffff26a (0b0111,1111,1111,1111,1111,0010,0110,1010)

- Multiband Dynamic Range Compression (MBDRC) Control Registers
- Bit
- Reset
- Description

