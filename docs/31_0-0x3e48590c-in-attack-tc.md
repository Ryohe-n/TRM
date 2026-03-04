# 31 :0 0x3e48590c IN_ATTACK_TC:

- Attack Time Constant for Input envelope detection (different
for each band) (1 - exp((-1.0 * BufferSize) / (Fs * INattackTC))). default: 1044928780 (0.001sec @ 48 kHz with 32 BufferSize). positive value only. Defining them as negative values will result in incorrect results.
- MBDRC_INRELEASE_0
This is an array of three identical register entries; the register fields below apply to each entry.
- Offset: 0x50,..,0x58
- Read/Write: RW
- Parity Protection: N
- Reset: 0x08414e9f (0b0000,1000,0100,0001,0100,1110,1001,1111)
- Bit
- Reset
- Description

