# 15 :0 0x8 PLL_EXT_FRU:

- External frequency control value
- LOOP_CTRL = 0,1,2: ENABLE = 0 -> 1 causes DCO to be initialized to
- EXT_FRU[15:0]
- LOOP_CTRL = 3: ENABLE = 0 -> 1 causes DCO to free-run with control
set to EXT_FRU[15:0]
- NVCSI_PHY_GLOBAL_PLL_MISC_2_0
- Offset: 0x1280b
- Byte Offset: 0x4a02c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,xxxx,0000)

- NVCSI PHY Registers
- Bit
- Reset
- Description

