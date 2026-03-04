# 2 ,048, 10,240, or 16,383 bytes. Alternatively, the truncation thresholds can be programmed in steps of 1 KB from 2 KB onwards.

- Supports IEEE 802.3 flow-control and priority-based flow control (PFC)
- Optional forwarding of received PAUSE/PFC control frames to the application
- Automatic transmission of zero-quanta PAUSE/PFC frames on flow-control input
deassertion
- Support for unicast PAUSE/PFC frame reception
- Transmission of PAUSE/PFC frames triggered by either software-controlled register bit or
optional input signal or based on Queue fill level (in MTL and AXI configurations).
- Support for VLAN-tagged frame processing in compliance with the IEEE 802.1Q standard
- Support for VLAN-tagged frame detection, stripping, and filtering
- Support for VLAN tag inclusion, replacement, or deletion in transmit frames through per-
frame Sideband control signals and the CSR Support for up to two Stacked-VLAN tagged or QinQ tagged packets. Support for the following flexible address-filtering modes for received frames: Up to 32 destination address (DA) perfect match address filters with masks for each byte. Up to 31 source address (SA) perfect match filters with masks for each byte. 64-bit, 128-bit, or 256-bit hash filter (optional) for multicast and unicast (DA) addresses. Option to pass all multicast-addressed frames. Promiscuous mode to pass all frames without any filtering for network monitoring.
- VLAN-based perfect matched and hash filtering
Up to eight Layer 3 and Layer 4-based (TCP or UDP over IPv4 or IPv6) match filters. Pass all incoming packets with a status report as determined by the filter.
- Control frame filtering other than PAUSE/PFC
- Option to forward all control frames other than PAUSE/PFC control frames
- Option to filter unicast control frames that fail the DA address perfect match filter
- Network statistics with RMON or MIB Counters (RFC2819/RFC2665)

