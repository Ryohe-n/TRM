# 4 ’b0000: The packet is a length packet. 4’b0001: The packet is a MAC Control packet. 4’b0010: DCB Control Packet. (Note: Inner Header of a tunneled packet is not parsed for DCB Control type.) 4’b0011: The packet is of ARP Request Packet Type. 4’b0100: The packet is of OAM packet type.(Note: Inner header of a tunneled packet is not parsed for OAM Control type) 4’b0101: The untagged packet has a Type field, which matched the value in the MAC_Rx_Eth_Type_Match register. 4’b0110: Reserved 4’b0111: The packet is an other Type Packet. 4’b1000: The packet is type packet with Single SVLAN tag. 4’b1001: The packet is type packet with Single CVLAN tag. 4’b1010: The packet is type packet with Double VLAN tag with outer VLAN is CVLAN and inner is also CVLAN. 4’b1011: The packet is type packet with Double VLAN tag with outer VLAN is SVLAN and inner is SVLAN. 4’b1100: The packet is type packet with Double VLAN tag with outer VLAN is SVLAN and inner is CVLAN. 4’b1101: The packet is type packet with Double VLAN tag with outer VLAN is CVLAN and inner is SVLAN. 4‘b1110 – 4’b1111: Reserved 4’h0110 – Untagged AV Control packet

- For a tunneled packet, the L2 packet type encoding refers to the L2
type of the Inner packet.
- Error Summary
- This bit indicates that the received packet has an error. Bits [19:16]
indicates the type of error. This field is valid only when the LD bit of RDES3 is set.
- Bit[0]: IP Header Error
- Bit[14]: Jabber Timeout
- Bit[13]: Packet Flush
- Bit[12]: Payload Checksum Error
- Bit[11]: Remote Fault
- Bit[10]: Local Fault
- Bit[2]: Underflow Error
- Flexible Receive Parser Status LSB bit

