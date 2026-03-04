# 31 :24 0x0 PSTQ3: Priorities Selected in Transmit Queue 3 This bit is similar to the PSTQ0 bit. 23:16 0x0 PSTQ2: Priorities Selected in Transmit Queue 2 This bit is similar to the PSTQ0 bit. 15:8 0x0 PSTQ1: Priorities Selected in Transmit Queue 1 This bit is similar to the PSTQ0 bit. 7:0 0x0 PSTQ0:

- Priorities Selected in Transmit Queue 0 This field holds the priorities assigned
to Tx Queue 0 by the software. This field determines if Tx Queue 0 should be blocked from transmitting specified pause time when a PFC packet is received with priorities matching the priorities programmed in this field. If the content of this field is not mutually exclusive to the corresponding fields of other
- Transmit queues, that is, same priority is mapped to multiple Tx queues, the
MAC blocks all queues with matching priority, for the specified time.
- EQOS_EQOS_MAC_MAC_TXQ_PRTY_MAP1_0
The Transmit Queue Priority Mapping 1 register contains the priority values assigned to Tx Queue 4 through Tx Queue 7.
- Offset: 0x9c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

