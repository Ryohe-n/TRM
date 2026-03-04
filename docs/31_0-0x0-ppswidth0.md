# 31 :0 0x0 PPSWIDTH0:

- PPS0 Output Signal Width. These bits store the width between the rising edge
and corresponding falling edge of PPS0 signal output. The width is stored in terms of number of units of sub-second increment value. You need to program one value less than the required interval. For example, if PTP reference clock is 50 MHz (period of 20 ns), and width between the rising and corresponding falling edges of PPS0 signal output is 80 ns (that is, four units of sub-second increment value), you should program value 3 (4 - 1) in this register. Note: The value programmed in this register must be lesser than the value programmed in MAC_PPS0_Interval.
- MGBE_DWCXG_CORE_MAC_PPS1_TARGET_TIME_SECONDS_0

10G Ethernet Controller Core Registers cont'd 1 The PPS1 Target Time Seconds register, along with PPS1 Target Time Nanoseconds register, is used to schedule an interrupt event [Bit 1 of MAC_Timestamp_Status] when the system time exceeds the value programmed in these registers. This register is present only when more than one Flexible PPS output is selected while configuring the controller.
- Offset: 0xd90
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

