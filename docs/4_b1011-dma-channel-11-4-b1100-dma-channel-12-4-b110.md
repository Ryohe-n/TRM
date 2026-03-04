# 4 'b1011: DMA Channel 11 - 4'b1100: DMA Channel 12 - 4'b1101: DMA

- Channel 13 - 4'b1110: DMA Channel 14 - 4'b1111: DMA Channel 15 The
width of this field depends on the number of Receive DMA channels, therefore all values might not be valid in certain configurations. For example, if the number of Rx DMA channels selected is 2, the only valid values are 0 and 1. Other values are reserved.
- RW
0x0 Q2DDMACH:
- Receive Queue 2 Enabled for Dynamic MA Channel Selection When set,
this bit indicates that each packet received in Receive Queue 2 is routed to a DMA channel as decided in the MAC Receiver based on the DMA channel number programmed in the L3-L4 filter registers, RSS lookup table, the Ethernet DA address registers or VLAN filter registers. When reset, this bit indicates that all packets received in Receive Queue 2 are routed to the DMA Channel programmed in the Q2MDMACH field. 22:20
- RO
0x0 Reserved_22_y: Reserved. 19:16
- RW
0x0 Q2MDMACH:
- Receive Queue 2 Mapped to DMA Channel This field controls the routing
of the received packet in Receive Queue 2 to the DMA channel. This field is valid when the Q2DDMACH field is reset. The encoding is the same as
- Q3MDMACH of this register. The width of this field depends on the
number of Receive DMA channels, therefore all values might not be valid in certain configurations. For example, if the number of Rx DMA channels selected is 2, the only valid values are 0 and 1. Other values are reserved.
- RW
0x0 Q1DDMACH:
- Receive Queue 1 Enabled for Dynamic DMA Channel Selection When set,
this bit indicates that each packet received in Receive Queue 1 is routed to a DMA channel as decided in the MAC Receiver based on the DMA channel number programmed in the L3-L4 filter registers, RSS lookup table, the Ethernet DA address registers or VLAN filter registers. When reset, this bit indicates that all packets received in Receive Queue 1 are routed to the DMA Channel programmed in the Q1MDMACH field. 14:12
- RO
0x0 Reserved_14_y: Reserved. 11:8
- RW
0x0 Q1MDMACH:
- Receive Queue 1 Mapped to DMA Channel This field controls the routing
of the received packet in Receive Queue 1 to the DMA channel. This field is valid when the Q1DDMACH field is reset. The encoding is the same as
- Q3MDMACH of this register. The width of this field depends on the
number of Receive DMA channels, therefore all values might not be valid in certain configurations. For example, if the number of Rx DMA channels selected is 2, the only valid values are 0 and 1. Other values are reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 Q0DDMACH:
- Receive Queue 0 Enabled for Dynamic DMA Channel Selection When set,
this bit indicates that each packet received in Receive Queue 0 is routed to a DMA channel as decided in the MAC Receiver based on the DMA channel number programmed in the L3-L4 filter registers, RSS lookup table, the Ethernet DA address or VLAN filter registers. When reset, this bit indicates that all packets received in Receive Queue 0 are routed to the DMA Channel programmed in the Q0MDMACH field. 6:4
- RO
0x0 Reserved_6_y: Reserved. 3:0
- RW
0x0 Q0MDMACH:
- Receive Queue 0 Mapped to DMA Channel This field controls the routing
of the packet received in Receive Queue 0 to the DMA channel. This field is valid when the Q0DDMACH field is reset. The encoding is the same as
- Q3MDMACH of this register. The width of this field depends on the
number of Receive DMA channels, therefore all values might not be valid in certain configurations. For example, if the number of Rx DMA channels selected is 2, the only valid values are 0 and 1. Other values are reserved.
- MGBE_DWCXG_MTL_MTL_RXQ_DMA_MAP1_0
The Receive Queue and DMA Channel Mapping 1 register controls the static or dynamic mapping of Receive Queues 4-7 to Receive DMA Channels.
- Offset: 0x1034
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 Q7DDMACH:
- Receive Queue 7 Enabled for Dynamic DMA Channel Selection When
set, this bit indicates that each packet received in Receive Queue 7 is routed to a DMA channel as decided in the MAC Receiver based on the DMA channel number programmed in the L3-L4 filter registers,
- RSS lookup table, the Ethernet DA address registers or VLAN filter
registers. When reset, this bit indicates that all packets received in
- Receive Queue 7 are routed to the DMA Channel programmed in the
Q7MDMACH field. 30:28
- RO
0x0 Reserved_30_y: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description

