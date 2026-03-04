# 0 = DIRECT 1 = PATCH 2 = SINE 3 = RSVD

- NVCSI_GLOBAL_TPG_EMB_CTRL_VC15_0
- Offset: 0x131

- NVCSI Global Registers
- Byte Offset: 0x4c4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x01000000 (0bxxxx,xxx1,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x1 PATTERN_MODE: The embbed line payload. 23:20 0x0 TOP_LINES: The embbed line number before the frame. 19:16 0x0 BOTTOM_LINES: The embbed line number after the frame. 15:0 0x0 WIDTH: Embedded line data width, unit is byte.
- NVCSI_GLOBAL_TPG_SIZE_VC15_0
- Offset: 0x132
- Byte Offset: 0x4c8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00400040 (0b0000,0000,0100,0000,0000,0000,0100,0000)
- Bit
- Reset
- Description

