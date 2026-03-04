# 2000 , 9018, 16384, or 32768) + 2 Pause Packet Size + IPG in Slot Times. 3:2

- RO
0x0 Reserved_3_2: Reserved.
- RW
0x0 TFE:
- Transmit Flow Control Enable When this bit is set in full-duplex mode,
the MAC enables the flow control operation to Tx pause packets. When this bit is reset, the flow control operation in the MAC is disabled, and the MAC does not transmit any pause packets.
- RW
0x0 FCB_BPA:
- Flow Control Busy This bit initiates a PFC packet if the TFE bit is set. To
initiate a PFC packet, the application must set this bit to 1'b1. During
- Control packet transfer, this bit continues to be set to indicate that a
packet transmission is in progress. When PFC packet transmission is complete, the MAC resets this bit to 1'b0. You should not write to this register until this bit is cleared. Access restriction applies. Setting 1 sets. Self-cleared. Setting 0 has no effect.
- EQOS_EQOS_MAC_MAC_RX_FLOW_CTRL_0
The Receive Flow Control register controls the pausing of MAC Transmit based on the received Pause packet.
- Offset: 0x90
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

