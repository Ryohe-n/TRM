# 20 :0 0x1fffff MAX_NUM:

- Maximum unsigned value allowed for the absolute value of the
numerator.
- This must always be smaller or equal than DEN/8 = 224/8 = 221 as
the TSC CAR logic requires at least eight clock cycles between two adjust requests.
- TSC_LOCKING_FAST_ADJUST_CONFIGURATION_0
- Offset: 0x210
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: TSC_SCR_TSCSCR_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,xx00,xxx0)
- Bit
- Reset
- Description

