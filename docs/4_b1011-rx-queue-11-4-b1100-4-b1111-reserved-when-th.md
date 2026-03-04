# 4 'b1011: Rx Queue 11 - 4'b1100 - 4'b1111: Reserved When the

- AV8021ASMEN bit of MAC_Timestamp_Control register is reset, even
though VLAN tagged PTP over Ethernet packets are processed, it is routed based on VLAN Tag priority.
- RW
0x0 TACPQE:
- Tagged AV Control Packets Queuing Enable. When set, the MAC routes
the received Tagged AV Control packets to the Rx queue specified by
- AVCPQ field. If Tagged AV Control packets received are expected to be
preempted then do not set the TACPQE bit to enable a separate queue.
- When reset, the MAC routes the received Tagged AV Control packets
based on the tag priority matching the PSRQ fields in MAC_RxQ_Ctrl2 and MAC_RxQ_Ctrl3 registers. 22:21
- RW
0x0 TPQC:
- Tagged PTP over Ethernet Packets Queuing Control. This field controls
the routing of the VLAN Tagged PTP over Ethernet packets. If Audio
- Video Bridging Feature is selected in the configuration, the following
programmable options are allowed. - 2'b00: VLAN Tagged PTP over
- Ethernet packets are routed as generic VLAN Tagged packet (based on
- PSRQ for only non-AV enabled Rx Queues). - 2'b01: VLAN Tagged PTP
over Ethernet packets are routed to Rx Queue specified by PTPQ field (That Rx Queue can be enabled for AV or non-AV traffic). - 2'b10: VLAN
- Tagged PTP over Ethernet packets are routed to only AV enabled Rx
- Queues based on PSRQ. - 2'b11: Reserved If Audio Video Bridging
- Feature is not selected in the configuration, the following programmable
options are allowed. - 1'b0: VLAN Tagged PTP over Ethernet packets are routed as generic VLAN Tagged packet (based on PSRQ for Data Center
- Bridging/Generic enabled Rx Queues). - 1'b1: VLAN Tagged PTP over
Ethernet packets are routed to Rx Queues specified by PTPQ field.
- RW
0x0 OMCBCQ:
- Programmable control for Over-riding MCBCQ Priority. When set to 1,
this field enables over-riding the MCBC Queue priority. When set to 0, this field disables over-riding the MCBC Queue priority. 19:16
- RW
0x0 DCBCPQ:
- DCB Control Packets Queue. This field specifies the Rx queue on which
the received DCB control packets are routed. - 4'b0000: Rx Queue 0 - 4'b0001: Rx Queue 1 - ... - 4'b1011: Rx Queue 11 - 4'b1100 - 4'b1111:
- Reserved The DCB data packets are routed based on the setting of the
- PSRQ field corresponding to its USP (User Priority) field in the
MAC_RxQ_Ctrl2/3 registers.
- RW
0x0 MCBCQEN:
- Multicast or Broadcast Queue Enable. This bit specifies that Multicast or
- Broadcast packets routing to the Rx Queue is enabled and the Multicast
or Broadcast packets must be routed to Rx Queue specified in MCBCQ field. 14:12
- RO
0x0 Reserved_14_12: Reserved.

10G Ethernet Controller Core Registers
- Bit
R/W
- Reset
- Description

