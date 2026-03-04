# 31 :0 0x0 RXDOCNTGBHI:

- Rx Good Bad Discard Octet Count High This field indicates the number of
octets received and discarded due to Filter Fail. This represents the upper 32 bits of the counter. Any packet dropped due to filtering and not counted in the normal RMON counters then this octet counter is incremented by packet size. This counter is incremented irrespective of whether it is a good or bad packet.
- MGBE_DWCXG_CORE_RX_PER_PRIORITY_STATUS_0
This register indicates which Rx Per Priority Counters of the selected priority (PRMMCSEL field of MMC Control register) had an interrupt.
- Offset: 0x9d0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description

