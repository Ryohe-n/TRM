# 31 :0 0x0 RXIPV6NOPAYPKTHI:

- RxIPv6 Payload Packets This field indicates upper 32 bits of IPv6 datagram
packets received that did not have a TCP, UDP, or ICMP payload. This includes all IPv6 datagrams with fragmentation or security extension headers.
- MGBE_DWCXG_CORE_RXUDP_GOOD_PACKETS_LOW_0
This register provides lower 32 bits of good IP datagrams received by DWC_xgmac with a good
- UDP payload. This counter is not updated when the RxIPv4_UDP_Checksum_Disabled_Packets
counter is incremented.

10G Ethernet Controller Core Registers cont'd 1
- Offset: 0xaa4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

