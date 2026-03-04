# 31 :0 0x7fffffff FAST_ATTACK_TC:

- Fast Attack Time Constant for Input envelope detection
(different for each band) (1 - exp((-1.0 * BufferSize) / (Fs * FastAttackTC))) default: 2147483647 (0.00001sec @ 48 kHz with 32
- BufferSize)
positive value only. Defining them as negative values will result in incorrect results
- MBDRC_IN_THRESH_0
This is an array of three identical register entries; the register fields below apply to each entry.
- Offset: 0x68,..,0x70

- Multiband Dynamic Range Compression (MBDRC) Control Registers
- Read/Write: RW
- Parity Protection: N
- Reset: 0x06145082 (0b0000,0110,0001,0100,0101,0000,1000,0010)
- Bit
- Reset
- Description

