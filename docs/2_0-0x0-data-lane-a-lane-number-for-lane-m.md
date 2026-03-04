# 2 :0 0x0 DATA_LANE_A: Lane number for lane merger A. 000: 0 lanes active 001: 1 lanes active 010: 2 lanes active 011: 3 lanes active (valid only in CPHY mode. NA in DPHY mode) 100: 4 lanes active, CLK from Partition A is used. 101: 4 lanes active, CLK from Partition B is used.

- Others: illegal
- NVCSI_PHY_3_NVCSI_CIL_CLKEN_OVERRIDE_CTRL_0
- Offset: 0x10705
- Byte Offset: 0x41c14
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 CLKEN_OVERRIDE: CLKENABLE OVERRIDE FOR CIL. 1 = ENABLE 0 = DISABLE
- NVCSI_PHY_3_NVCSI_CIL_PAD_CONFIG_0
- Offset: 0x10706
- Byte Offset: 0x41c18

- NVCSI PHY Registers
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00040100 (0bxxxx,x000,0000,0100,0000,xxx1,0000,0000)
- Bit
- Reset
- Description

