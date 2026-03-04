# 0000 : Reserved 0001: Watchdog Timeout Error: It indicates that the Receive Watchdog Timer has expired while receiving the current packet. The current packet is truncated after watchdog timeout. 0010: Invalid Code Error: It indicates that the frame was terminated due to the reception of an invalid code character. 0011: CRC Error: It indicates that a Cyclic Redundancy Check (CRC) Error occurred on the received packet. 0100: Giant Packet Error: It indicates that the packet length exceeds the specified maximum Ethernet size of 1518,1522, or 2000 bytes (9018 or 9022 bytes if jumbo packet enable is set).

- Note: Giant packet indicates only the packet length. It does not
cause any packet truncation. 0101: IP Header Error: It indicates that the 16-bit IPv4 Header checksum calculated by the DWC_xgmac controller does not match the received Checksum bytes or that the IP datagram version is not consistent with the Ethernet Type value. This error is possible only when you select the Enable Receive TCP/IP Checksum Check feature. 0110: Payload (L4) Checksum Error: It indicates that the 16-bit IP payload checksum (that is, the TCP, UDP, or ICMP checksum) calculated by the DWC_xgmac controller does not match the received TCP, UDP, or ICMP checksum field. 0111: Overflow Error: It indicates that the received packet is damaged because of buffer overflow in Rx FIFO. Note: This bit is set only when the DMA transfers a partial packet to the application. This happens only when the Rx FIFO is operating in the threshold mode. In the store-and-forward mode, all partial packets are dropped completely in Rx FIFO. 1000: Bus Error: It indicates that AXI Bus Error response is received while fetching this descriptor or when packet is being transferred to its buffers. 1001: Length Error: It indicates that the Length value of the current frame is inconsistent with the total number of bytes received in the current frame. This is applicable when Frame
- Length value is less than 1500. This error is reported when the
following types of frames are received:
- Frames in which the value of the Length field is less than 46
bytes and the length of the received frame is less than the following: Length field + 18 bytes
- Frames in which the value of the Length field is equal to or
greater than 46 bytes and the length of the received frame is not equal to the following: Length field + 18 bytes 1010: Good runt packet. Packet less than 64 bytes but with good CRC. 1011: Reserved 1100: Dribble Error: Indicates that, in the 10/100Mbps speed mode, the packet has ended without a byte boundary. 1101 -1111: Reserved for non-tunneled packets
- In the case of Tunneled packet, the Error Status is extended to
differentiate between the errors in outer Header or Inner Header. In the status types, the following values are applicable for the Outer Header fields: 0101: Outer IP Header Error

10G Ethernet Controller Functional Description 0110: Outer Header Payload (L4) Checksum Error Additionally, the following Error Status types are applicable: 1001: Inner Packet IP Header Error 1010: Inner Packet Payload (L4) Checksum Error 1011: Invalid VxLAN Header Field
- It indicates that the VxLAN Header Flag field did not have the value
0x08. 101-1111: Reserved for tunneled packets
- When ES = 0 (L2 Packet Type Encoding)

