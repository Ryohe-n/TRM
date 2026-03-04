# 31 :24 0x0 PSTQ7: Priorities Selected in Transmit Queue 7 This bit is similar to the PSTQ4 bit. 23:16 0x0 PSTQ6: Priorities Selected in Transmit Queue 6 This bit is similar to the PSTQ4 bit. 15:8 0x0 PSTQ5: Priorities Selected in Transmit Queue 5 This bit is similar to the PSTQ4 bit. 7:0 0x0 PSTQ4:

- Priorities Selected in Transmit Queue 4 This field holds the priorities assigned
to Tx Queue 4 by the software. This field determines if Tx Queue 4 should be blocked from transmitting specified pause time when a PFC packet is received with priorities matching the priorities programmed in this field. If the content of this field is not mutually exclusive to corresponding fields of other Transmit queues, that is, same priority is mapped to multiple Tx queues, the MAC blocks all queues with matching priority for specified time.

1G Ethernet Controller Core Registers
- EQOS_EQOS_MAC_MAC_RXQ_CTRL0_0
The Receive Queue Control 0 register controls the queue management in the MAC Receiver. Note: In multiple Rx queues configuration, all the queues are disabled by default. Enable the Rx queue by programming the corresponding field in this register.
- Offset: 0xa0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

