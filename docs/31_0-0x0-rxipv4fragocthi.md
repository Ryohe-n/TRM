# 31 :0 0x0 RXIPV4FRAGOCTHI:

- RxIPv4 Fragmented Octets This field indicates upper 32 bits of bytes
received in fragmented IPv4 datagrams. The value in the Length field of IPv4 header is used to update this counter. (Ethernet header, FCS, pad, or IP pad bytes are not included in this counter.
- MGBE_DWCXG_CORE_RXIPV4_UDP_CHECKSUM_DISABLE_OCTETS_LOW_0
This register provides lower 32 bits of bytes received by DWC_xgmac in a UDP segment that had the UDP checksum disabled. This counter does not count IP Header bytes. (Ethernet header, FCS, pad, or IP pad bytes are not included in this counter.)
- Offset: 0xaf4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description

