# 31 :0 0x0 PPSWIDTH1:

- PPS1 Output Signal Width. These bits store the width between the rising edge
and corresponding falling edge of PPS1 signal output. The width is stored in terms of number of units of sub-second increment value. You need to program one value less than the required interval. For example, if PTP reference clock is 50 MHz (period of 20 ns), and width between the rising and corresponding falling edges of PPS1 signal output is 80 ns (that is, four units of sub-second increment value), you should program value 3 (4 - 1) in this register. Note: The value programmed in this register must be lesser than the value programmed in MAC_PPS1_Interval.

10G Ethernet Controller Core Registers cont'd 1
- MGBE_DWCXG_CORE_MAC_PTO_CONTROL_0
This register controls the PTP Offload Engine operation. This register is available only when the Enable PTP Timestamp Offload feature is selected.
- Offset: 0xdc0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

