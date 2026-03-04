# 0 CLOCKIN / 1 1-15 CLOCKIN / PLL_MDIV[3:0]


- NVCSI PHY Registers
- Bit
R/W
- Reset
- Description
- RW
0x0 PLL_DIV_RATIO_OVERRIDE: 0 -> Normal operation, M-divier/P-divider/N-divider/
- CLKGEN_MODE/PDIV_MODE are controlled by
SEL_DPHY_CPHY_PLL. 1 -> Enable the manual control of PLL_MDIV/P-divider/PLL_NDIV/
- CLKGEN_MODE/PDIV_MODE. P-divider and N-divider are
programmable through PLL_PDIV_RATIO and PLL_NDIV_RATIO.
- RO
0x0 PLL_LOCK:
- PLL lock detector output (1 = locked, 0 = unlocked)
- De-assert when dynamic frequency change is initiated
- RO
0x0 PLL_FREQLOCK:
- Frequency lock indicator
- FLL lock detector output (1 = locked, 0 = unlocked)
- RW
0x0 PLL_RESETB:
- Digital force reset (Active low)
- RW
0x1 PLL_BYPASS: 0 -> normal operation; 1 -> enable PLL bypass mode, allowing the reference clock to drive the output driver directly.
- RW
0x0 PLL_SEL_DPHY_CPHY: CPHY/DPHY mode.
- NVCSI_PHY_GLOBAL_PLL_MISC_0_0
- Offset: 0x12809
- Byte Offset: 0x4a024
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000007 (0b0000,0000,0000,0000,0000,0000,0000,0111)
- Bit
- Reset
- Description

