# 23 :0 0x12c0 DURATION:

- Number of samples to reach the target volume
default: 0x12C0 (100ms @ 48 kHz)
- If Software program this register, must be followed by
- DURATION_SWITCH trigger to let Hardware know new duration
parameters ready.
- Hardware will take the new duration parameter after finishing
current frame
- MVC_DURATION_INV_0

- Master Volume Control (MVC) Registers
- Offset: 0xf4
- Read/Write: RW
- Parity Protection: N
- Reset: 0x0006d3a0 (0b0000,0000,0000,0110,1101,0011,1010,0000)
- Bit
- Reset
- Description

