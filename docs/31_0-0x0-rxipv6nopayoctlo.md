# 31 :0 0x0 RXIPV6NOPAYOCTLO:

- RxIPv6 Payload Octets This field indicates lower 32 bits of bytes received in
- IPv6 datagrams that did not have a TCP, UDP, or ICMP payload. The value in
the Length field of IPv6 header is used to update this counter. (Ethernet header, FCS, pad, or IP pad bytes are not included in this counter.
- MGBE_DWCXG_CORE_RXIPV6_NO_PAYLOAD_OCTETS_HIGH_0

10G Ethernet Controller Core Registers cont'd 1 This register provides upper 32 bits of bytes received by DWC_xgmac in IPv6 datagrams that did not have a TCP, UDP, or ICMP payload. The value in the Length field of IPv6 header is used to update this counter. (Ethernet header, FCS, pad, or IP pad bytes are not included in this counter.)
- Offset: 0xb10
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

