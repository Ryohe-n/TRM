# 31 :30 0x0 Reserved_31_30: Reserved. 29:16 0x0 PRXQ:

- Number of Packets in Receive Queue. This field indicates the current
number of packets in the Rx Queue. The theoretical maximum value for this field is 256KB/16B = 16K Packets, that is, Max_Queue_Size/ Min_Packet_Size. 15:6 0x0 Reserved_15_6: Reserved. 5:4 0x0 RXQSTS:
- MTL Rx Queue Fill-Level Status. This field gives the status of the fill-level of
the Rx Queue: - 00: Rx Queue empty - 01: Rx Queue fill-level below flow- control deactivate threshold - 10: Rx Queue fill-level above flow-control activate threshold - 11: Rx Queue full 0x0 Reserved_3: Reserved. 2:1 0x0 RRCSTS:
- MTL Rx Queue Read Controller State. This field gives the state of the Rx
queue Read controller: - 00: Idle state - 01: Reading packet data - 10:
- Reading packet status (or timestamp) - 11: Flushing the packet data and
status 0x0 RWCSTS:
- MTL Rx Queue Write Controller Active Status. When high, this bit indicates
that the MTL Rx queue Write controller is active, and it is transferring a received packet to the Rx Queue.
- MGBE_DWCXG_MTL_Q9_MTL_RXQ9_CONTROL_0
The Queue 9 Receive Control register controls the receive arbitration and passing of received packets to the application.
- Offset: 0x15cc
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

