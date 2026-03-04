# 31 :16 0x0 Reserved_31_16: Reserved. 0x0 UFCNTOVF:

- Overflow Bit for Underflow Packet Counter. This bit is set every time the Tx
- Queue Underflow Packet Counter field overflows, that is, it has crossed the
maximum count. In such a scenario, the overflow packet counter is reset to all-zeros and this bit indicates that the rollover happened. 14:11 0x0 Reserved_14_11: Reserved. 10:0 0x0 UFPKTCNT:
- Underflow Packet Counter. This field indicates the number of packets
aborted by the controller because of Transmit Queue Underflow. This counter is incremented each time the MAC aborts an outgoing packet because of underflow. The counter is reset when this register is read with mci_be_i[0] at 1'b1.
- MGBE_DWCXG_MTL_Q9_MTL_TXQ9_DEBUG_0
The Queue 9 Transmit Debug register gives the debug status of various blocks related to the Transmit Queue 9 and Traffic Class 0.
- Offset: 0x1588
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

