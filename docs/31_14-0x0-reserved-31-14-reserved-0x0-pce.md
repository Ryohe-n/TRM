# 31 :14 0x0 Reserved_31_14: Reserved. 0x0 PCE:

- Payload Checksum Error. This bit indicates that the Checksum Offload engine
detected IP payload error and did not insert any checksum into the encapsulated TCP, UDP, or ICMP payload. This failure can be either because of insufficient bytes, as indicated by the Payload Length field of the IP Header or the MTL starting to forward the packet to the MAC transmitter in Store-and-
- Forward mode without the checksum having been calculated yet. This second
error condition only occurs when the Transmit Queue depth is less than the length of the IP packet being transmitted to avoid deadlock, the MTL starts forwarding the packet when the FIFO is full, even in the store-and-forward mode. Access restriction applies. Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event. 0x0 IHE:
- IP Header Error. This bit indicates that the Checksum Offload engine detected
- IP header error. This failure can be either because of received Ethernet type is
0x0800 but Version field of IPv4 header is not equal to 0x4, IPv4 Header Length field indicates a value less than 0x5 (20 bytes), total packet length is less than the value given in the IPv4 Header Length field, received Ethernet type is 0x86dd but IPv6 header Version field is not equal to 0x6, packet ends before the
- IPv6 header (40 bytes) or extension header (as given in the corresponding
- Header Length field in an extension header) is completely received. Access
restriction applies. Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event.

10G Ethernet Controller Core Registers
- Bit
- Reset
- Description

