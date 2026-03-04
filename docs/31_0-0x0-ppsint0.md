# 31 :0 0x0 PPSINT0:

- PPS0 Output Signal Interval. These bits store the interval between the rising
edges of PPS0 signal output. The interval is stored in terms of number of units of sub-second increment value. You need to program one value less than the required interval. For example, if the PTP reference clock is 50 MHz (period of 20 ns), and desired interval between the rising edges of PPS0 signal output is 100 ns (that is, five units of sub-second increment value), you should program value 4 (5 - 1) in this register.
- MGBE_DWCXG_CORE_MAC_PPS0_WIDTH_0
The PPS0 Width register contains the number of units of sub-second increment value between the rising and corresponding falling edges of PPS0 signal output (ptp_pps_o[0]).
- Offset: 0xd8c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

