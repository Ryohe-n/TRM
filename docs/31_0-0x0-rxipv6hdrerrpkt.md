# 31 :0 0x0 RXIPV6HDRERRPKT:

- RxIPv6 Header Error Packets This field indicates the number of IPv6
datagrams received with header (length or version mismatch) errors.

1G Ethernet Controller Core Registers
- EQOS_EQOS_MAC_RXIPV6_NO_PAYLOAD_PACKETS_0
This register provides the number of IPv6 datagram packets received by DWC_ether_qos that did not have a TCP, UDP, or ICMP payload. This includes all IPv6 datagrams with fragmentation or security extension headers.
- Offset: 0x82c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

