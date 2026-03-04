# 10 :0 0x0 UFFRMCNT:

- Underflow Packet Counter This field indicates the number of packets
aborted by the controller because of Tx Queue Underflow. This counter is incremented each time the MAC aborts outgoing packet because of underflow. The counter is cleared when this register is read with mci_be_i[0] at 1'b1. Access restriction applies. Clears on read. Self-set to 1 on internal event.
- EQOS_EQOS_MTL_Q7_MTL_TXQ7_DEBUG_0
The Queue 7 Transmit Debug register gives the debug status of various blocks related to the Transmit queue.
- Offset: 0xec8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

