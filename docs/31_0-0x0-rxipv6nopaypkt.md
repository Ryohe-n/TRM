# 31 :0 0x0 RXIPV6NOPAYPKT:

- RxIPv6 Payload Packets This field indicates the number of IPv6 datagram
packets received that did not have a TCP, UDP, or ICMP payload. This includes all IPv6 datagrams with fragmentation or security extension headers.
- EQOS_EQOS_MAC_RXUDP_GOOD_PACKETS_0
This register provides the number of good IP datagrams received by DWC_ether_qos with a good
- UDP payload. This counter is not updated when the RxIPv4_UDP_Checksum_Disabled_Packets
counter is incremented.
- Offset: 0x830
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

