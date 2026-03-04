# 31 :0 0x0 RXIPV4NOPAYOCTLO:

- RxIPv4 Payload Octets This field indicates lower 32 bits of bytes received in
- IPv4 datagrams that did not have a TCP, UDP, or ICMP payload. The value in
the Length field of IPv4 header is used to update this counter. (Ethernet header, FCS, pad, or IP pad bytes are not included in this counter.
- MGBE_DWCXG_CORE_RXIPV4_NO_PAYLOAD_OCTETS_HIGH_0
This register provides upper 32 bits of bytes received by DWC_xgmac in IPv4 datagrams that did not have a TCP, UDP, or ICMP payload. The value in the Length field of IPv4 header is used to update this counter. (Ethernet header, FCS, pad, or IP pad bytes are not included in this counter.
- Offset: 0xae8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

