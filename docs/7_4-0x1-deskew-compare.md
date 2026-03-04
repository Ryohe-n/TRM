# 7 :4 0x1 DESKEW_COMPARE:

- Regsiter select to control the number of comparisons to be done for each
trimmer setting during deskew calibration. 3:0 0x1 DESKEW_SETTLE:
- Regsiter select to control the number of byte clocks to wait before INADJ
value settles. This is used during deskew calibration
- NVCSI_PHY_3_NVCSI_CIL_B_CONTROL_0
- Offset: 0x1077a
- Byte Offset: 0x41de8
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected

- NVCSI PHY Registers
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 BYPASS_LP_FILTER: Bypass the glitch filter. 30:24 0x0 CLK_SETTLE1_B:
- Used only in CPHY mode, Settle time for clk start when moving B1 data
lane from LP to HS (LP11->LP01->LP00). 23:17 0x0 CLK_SETTLE0_B: Used for both CPHY/DPY mode.
- For DPHY: Settle time for clk lane when moving from LP to HS (LP11-
>LP01->LP00), this setting determines how many csicil clock cycles to wait after LP00. If the settle set to 0 or 8, the real setting is 1, otherwise, the real setting is (4+settle)
- For CPHY: Settle time for clk start when moving B0 data lane from LP to
HS (LP11->LP01->LP00). 16:9 0x0 THS_SETTLE1_B: settle time for B1 data lane when moving from LP to HS (LP11->LP01- >LP00), this setting determines how many LP clock cycles to wait, after LP00, before starting to look at the data. 8:1 0x0 THS_SETTLE0_B: settle time for B0 data lane when moving from LP to HS (LP11->LP01- >LP00), this setting determines how many LP clock cycles to wait, after LP00, before starting to look at the data. 0x0 BYPASS_LP_SEQ:
- For DPHY: The clock lane LP signals should sequence through LP11->LP01-
>LP00 state, to indicate to CLOCK CIL about the mode switching to HS Rx mode.
- In case Camera is enabled earlier than CIL , it is highly likely that camera
sends this control sequence sooner than cil can detect it.
- Enabling this bit allows the CLOCK CIL to overlook the LP control sequence
and step in HS Rx mode directly looking at LP00 only.
- For CPHY: it's only used for debug purpose as it's embedded clock for
CPHY, clock will always presents when the data lane toggle.
- NVCSI_PHY_3_NVCSI_CIL_B_CPHY_ERR_STATUS_0
- Offset: 0x1077b
- Byte Offset: 0x41dec
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0xXXXXXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)

- NVCSI PHY Registers
- Bit
- Reset
- Description

