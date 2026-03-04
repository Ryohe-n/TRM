# 0 /2/4/6 bit to search sync word. 0x1 DISABLE_SB_ERR_IN_SYNC_B: Allow one single bit error in sync word 6MSB.

- NVCSI_PHY_3_NVCSI_CIL_B_DPHY_DESKEW_SYNC_PATTERN_0
- Offset: 0x10781
- Byte Offset: 0x41e04
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 INVERT_DESKEW_PATTERN: Invert the de-skew pattern.
- NVCSI_PHY_3_NVCSI_CIL_B_CPHY_SYNC_SEARCH_0
- Offset: 0x10782
- Byte Offset: 0x41e08
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x01080108 (0bxxxx,xxx1,0000,1000,xxxx,xxx1,0000,1000)
- Bit
- Reset
- Description
0x1 COUNT_EN_TRIO1_B: Check if the symbol is pre-amble before sync word. 23:16 0x8 PERIOD_TRIO1_B:
- For CPHY, how many cycles allowed for non pre-amble symbol
before sync word. 0x1 COUNT_EN_TRIO0_B: Check if the symbol is pre-amble before sync word.

- NVCSI PHY Registers
- Bit
- Reset
- Description

