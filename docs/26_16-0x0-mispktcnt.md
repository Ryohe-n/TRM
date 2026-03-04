# 26 :16 0x0 MISPKTCNT:

- Missed Packet Counter This field indicates the number of packets missed by
the DWC_ether_qos because the application asserted ari_pkt_flush_i[] for this queue. This counter is reset when this register is read with mci_be_i[0] at 1b1. This counter is incremented by 1 when the DMA discards the packet because of buffer unavailability. Access restriction applies. Clears on read. Self-set to 1 on internal event. 15:12 0x0 Reserved_15_12: Reserved. 0x0 OVFCNTOVF:
- Overflow Counter Overflow Bit When set, this bit indicates that the Rx Queue
- Overflow Packet Counter field crossed the maximum limit. Access restriction
applies. Clears on read. Self-set to 1 on internal event. 10:0 0x0 OVFPKTCNT:
- Overflow Packet Counter This field indicates the number of packets
discarded by the DWC_ether_qos because of Receive queue overflow. This counter is incremented each time the DWC_ether_qos discards an incoming packet because of overflow. This counter is reset when this register is read with mci_be_i[0] at 1'b1. Access restriction applies. Clears on read. Self-set to 1 on internal event.
- EQOS_EQOS_MTL_Q7_MTL_RXQ7_DEBUG_0
- The Queue 7 Receive Debug register gives the debug status of various blocks related to the
Receive queue.
- Offset: 0xef8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

