# 31 :6 0x0 Reserved_31_6: Reserved. 0x0 TRCPSTS:

- MTL TRC Pending Status When this bit is high, it indicates that the MTL Tx
Read Controller (TRC) has a pending status from MAC.

10G Ethernet Controller Core Registers cont'd 2
- Bit
- Reset
- Description
0x0 TXQSTS:
- MTL Tx Queue Not Empty Status. When this bit is high, it indicates that the
MTL Tx Queue is not empty and some data is left for transmission. 0x0 TWCSTS:
- MTL Tx Queue Write Controller Status. When high, this bit indicates that the
- MTL Tx Queue Write Controller is active, and it is transferring the data to the Tx
Queue. 2:1 0x0 TRCSTS:
- MTL Tx Queue Read Controller Status. This field indicates the state of the Tx
- Queue Read Controller: - 00: Idle state - 01: Read state (transferring data to the
- MAC transmitter) - 10: Waiting for pending Tx Status from the MAC transmitter
- 11: Flushing the Tx queue because of the Packet Abort request from the MAC
0x0 TCPAUSED:
- Traffic Class in Pause. When this bit is high and the Rx flow control is enabled, it
indicates that the Traffic Class 1 is in the Pause condition because of the following: - Reception of the PFC packet for the priorities assigned to the
- Traffic Class 1 when PFC is enabled - Reception of IEEE 802.3-2018 Pause
packet when PFC is disabled For TCQn, where n is 1 to 7, this bit is reserved and
- RO when the number of traffic class selected is less than n + 1 This field is
reserved and RO in the corresponding Queues 8-15 registers
- MGBE_DWCXG_MTL_Q9_MTL_RXQ9_OPERATION_MODE_0
The Queue 9 Receive Operation Mode register establishes the Receive queue operating modes and command.
- Offset: 0x15c0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

