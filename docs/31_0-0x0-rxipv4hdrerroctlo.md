# 31 :0 0x0 RXIPV4HDRERROCTLO:

- RxIPv4 Header Error Octets This field indicates lower 32 bits of bytes
received in IPv4 datagrams with header errors (checksum, length, version mismatch). The value in the Length field of IPv4 header is used to update this counter. (Ethernet header, FCS, pad, or IP pad bytes are not included in this counter.
- MGBE_DWCXG_CORE_RXIPV4_HEADER_ERROR_OCTETS_HIGH_0
- This register provides upper 32 bits of bytes received by DWC_xgmac in IPv4 datagrams with
header errors (checksum, length, version mismatch). The value in the Length field of IPv4 header is used to update this counter. (Ethernet header, FCS, pad, or IP pad bytes are not included in this counter.
- Offset: 0xae0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

