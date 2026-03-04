# 31 :0 0x0 RXDPCNTGBHI:

- Rx Good Bad Discard Packet Count High This field indicates the number of
packets received and discarded due to Filter Fail. This represents the upper 32 bits of the counter. When a packet is dropped due to filtering and not counted in the normal RMON counters, this counter is incremented. This counter is incremented irrespective of whether it is a good or bad packet.
- MGBE_DWCXG_CORE_RX_DISCARD_OCTETS_GOOD_BAD_LOW_0
This register provides lower 32 bits of received good bad octets count that were discarded due to filter fail.
- Offset: 0x9b4
- Read/Write: RO

10G Ethernet Controller Core Registers cont'd 1
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

