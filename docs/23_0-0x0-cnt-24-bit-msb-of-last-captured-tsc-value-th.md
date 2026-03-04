# 23 :0 0x0 CNT: 24 bit MSB of last captured TSC value. There is no specific hardware protection to insure atomicity, software can either use consistency techniques to detect errors or suspend then resume the register update while reading the VALUE registers

- TSC_LOCKING_CONFIGURATION_0
- Hardware and Software Locking Registers
- Offset: 0x1e8
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: TSC_SCR_TSCSCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xx00,xx00,0000)
- Bit
- Reset
- Description

