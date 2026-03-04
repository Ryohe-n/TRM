# 1 clears the bit and writing 0 keeps overflow bit unchanged) 0 = NONE 1 = DETECTED 23:0

- RO
0x0 PERIOD:
- This field indicates the period (N-1) of the fan tach input in units of 1
micro-second in a WIN_LENGTH. Software needs to add 1 to this value to get the correct period value. This field updates on the first rising edge of the fan tach input for every new window.
- TACH_FAN_TACH1_0
- Offset: 0x4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

