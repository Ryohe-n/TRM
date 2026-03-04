# 13 :11 0x0 POLARITY_SWIZZLE_CPHY1_A:

- Polarity Swizle control for Lane A1 in CPHY mode. valid only in CPHY
mode 000 - A B C --> A B C 001 - A B C --> A C B 010 - A B C --> B C A 011 - A B C --> B A C 100 - A B C --> C A B 101 - A B C --> C B A 10:8 0x0 POLARITY_SWIZZLE_CPHY0_A:
- Polarity Swizle control for Lane A0 in CPHY mode. valid only in CPHY
mode 000 - A B C --> A B C 001 - A B C --> A C B 010 - A B C --> B C A 011 - A B C --> B A C 100 - A B C --> C A B 101 - A B C --> C B A

- NVCSI PHY Registers
- Bit
- Reset
- Description
0x0 POLARITY_SWIZZLE_CLK_A:
- Polarity Swizzle control for clock lane A. Valid only in DPHY mode, need
to work with ALLOW_FIRST_BIT_ON_CLK_NEGEDGE if enabled. 0x0 POLARITY_SWIZZLE_DPHY1_A: Polarity Swizzle control for data lane A1. Valid only in DPHY mode. 0x0 POLARITY_SWIZZLE_DPHY0_A: Polarity Swizzle control for data lane A0. Valid only in DPHY mode.
- NVCSI_PHY_3_NVCSI_CIL_A_DESKEW_CONTROL_0
- Offset: 0x10739
- Byte Offset: 0x41ce4
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00007411 (0bxxxx,xxxx,xxxx,xxxx,0111,0100,0001,0001)
- Bit
- Reset
- Description

