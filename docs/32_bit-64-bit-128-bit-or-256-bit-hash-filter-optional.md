# 32 -bit, 64-bit, 128-bit, or 256-bit Hash filter (optional) for multicast and unicast (DA) addresses

- Option to pass all multicast-addressed packets
- Promiscuous mode to pass all packets without any filtering for network monitoring
Pass all incoming packets (as per filter) with a status report. Additional packet filtering:
- VLAN tag-based: Perfect match and Hash-based (optional) filtering. Filtering based on
either outer or inner VLAN tag is possible.
- Layer 3 and Layer 4-based: TCP or UDP over IPv4 or IPv6
- VLAN tag-based filtering (extended) with 4, 8, 16, or 32 filter selections
- IEEE 802.1Q VLAN tag detection with option to delete the VLAN tags in received packets
GPIO based wakeup (PHY detects Wake packets and interrupts controller).
- Optional forwarding of received Pause packets to the application (in full-duplex mode)
- Optional Receive module for Layer 3/Layer 4 checksum offload for received packets
Optional stripping of VLAN Tags and providing the tags in the status.
#### 10.6.1.3 Transaction Layer (MTL)
The Transaction Layer (MTL) block has a 36 KB Tx FIFO and a 36 KB Rx FIFO. Multiple queues (up to eight) share the FIFO space and the buffer size is configurable for each queue in multiples of 256 bytes. The MTL block supports the following features:

1G Ethernet Controller
##### 10.6.1.3.1 Tx and Rx Features

