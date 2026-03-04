# 31 :0 0x0 RXIPV6NOPAYOCTHI:

- RxIPv6 Payload Octets This field indicates upper 32 bits of bytes received in
- IPv6 datagrams that did not have a TCP, UDP, or ICMP payload. The value in
the Length field of IPv6 header is used to update this counter. (Ethernet header, FCS, pad, or IP pad bytes are not included in this counter.
- MGBE_DWCXG_CORE_RXUDP_GOOD_OCTETS_LOW_0
This register provides lower 32 bits of bytes received by DWC_xgmac in a good UDP segment. This counter does not count IP header bytes.
- Offset: 0xb14
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

