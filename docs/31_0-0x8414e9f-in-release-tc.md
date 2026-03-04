# 31 :0 0x8414e9f IN_RELEASE_TC:

- Release Time Constant for Input envelope detection (different
for each band) (1 - exp((-1.0 * BufferSize) / (Fs * INrttackTC))) default: 138497695 (0.01sec @ 48 kHz with 32 BufferSize) positive value only. Defining them as negative values will result in incorrect results
- MBDRC_FASTATTACK_0
This is an array of three identical register entries; the register fields below apply to each entry.
- Offset: 0x5c,.,0x64
- Read/Write: RW
- Parity Protection: N
- Reset: 0x7fffffff (0b0111,1111,1111,1111,1111,1111,1111,1111)
- Bit
- Reset
- Description

