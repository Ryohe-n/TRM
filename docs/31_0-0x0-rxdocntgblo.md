# 31 :0 0x0 RXDOCNTGBLO:

- Rx Good Bad Discard Octet Count Low This field indicates the number of
octets received and discarded due to Filter Fail. This represents the lower 32 bits of the counter. When a packet is dropped due to filtering and not counted in the normal RMON counters, this octet counter is incremented by packet size. This counter is incremented irrespective of whether it is a good or bad packet.
- MGBE_DWCXG_CORE_RX_DISCARD_OCTETS_GOOD_BAD_HIGH_0
This register provides upper 32 bits of received good bad octets count that were discarded due to filter fail.
- Offset: 0x9b8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

