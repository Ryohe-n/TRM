# 32 bits from the default 96 bits, depending on the programming of the IPG field. In the XGMII mode, this bit has higher priority than the ISM bit. When this bit is reset, the minimum IFG is decreased in steps of 8 bits from the default 96 bits, depending on the programming of the IPG field. 10:8

- RW
0x0 IPG:
- Inter-Packet Gap These bits control the minimum IPG between packets
during transmission. When IFP is cleared, the minimum IPG between transmitted packets is reduced in both GMII and XGMII mode. The corresponding IPG values are given as follows. - 3'b000: 96 bit times - 3'b001: 88 bit times - 3'b010: 80 bit times - 3'b011: 72 bit times - 3'b100: 64 bit times - 3'b101: 3'b111: Reserved In the half-duplex mode, the minimum IPG can be configured only for 64-bit times (IPG = 100). Lower values are not considered. When a JAM pattern is transmitted because of backpressure activation, the MAC does not consider the minimum IPG.
- When IFP is set, the minimum IPG is increased in steps of 32 bits as
follows. In 10G (XGMII) mode, when IFP is set, it overrides the functions of
- DDIC and ISM bits. The EIPG bits (in MAC_Extended_Configuration
register) along with IPG bits gives a 10-bit value to control the required IPG as follows: - {EIPG,IPG}: Minimum Inter-Packet Gap - 10'h000: 96 bit times - 10'h001: 128 bit times - 10'h002: 160 bit times - 10'h003: 192 bit times - 10'h004: 224 bit times - ... - 10'h3FF: 32832 bit times 7:4
- RW
0x0 ISR:
- IFG Stretch Ratio. This value controls the number of bytes in a transmitted
packet for which one octet of IDLE is added to the IFG. To operate DWC_xgmac for 10GBASE-W (WIS layer), the value must be 13 (decimal).
- Note that 0 is not a valid value and must not be written. Before enabling
- ISM (IFG Stretch Mode) bit, this ISR number should be programmed to a
non-zero value.
- RW
0x0 ISM:
- IFG Stretch Mode. When this bit is set, DWC_xgmac enforces extended
inter-packet spacing (one extra octet of IDLE for every ISR (IFG Stretch
- Ratio) number of bytes) to support less-than-10-Gbps data rates. When
this bit is reset, inter-packet gap extension is not performed.
- RO
0x0 Reserved_2: Reserved.
- RW
0x0 DDIC:
- Disable DIC Algorithm. When this bit is set, the Deficit Idle Count (DIC)
algorithm is disabled and DWC_xgmac always has a minimum IFG of 12 bytes between transmitted packets. When reset to zero, the DIC is activated and the minimum IFG varies between 9 and 15 bytes.
- RW
0x0 TE:
- Transmitter Enable. When this bit is set, the Tx state machine of the MAC
is enabled for transmission on the GMII or XGMII interface. When this bit is reset, the MAC Tx state machine is disabled after it completes the transmission of the current packet. The Tx state machine does not transmit any more packets.
- MGBE_DWCXG_CORE_MAC_PACKET_FILTER_0

10G Ethernet Controller Core Registers The MAC Packet Filter register contains the filter controls for receiving packets. Some of the controls from this register go to the address check block of the MAC which performs the first level of address filtering. The second level of filtering is performed on the incoming packet based on other controls such as Pass Bad Packets and Pass Control Packets.
- Offset: 0x8
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
0x0 RA:
- Receive All. When this bit is set, the MAC Receiver module passes all the
received packets to the application, irrespective of whether they pass the address filter or not. The result of the SA or DA filtering is updated (pass or fail) in the corresponding bit in the Rx Status Word. When this bit is reset, the Receiver module passes only those packets to the application that pass the SA or DA address filter. 30:23
- RO
0x0 Reserved_30_23: Reserved.
- RO
0x0 Reserved_VUCC: Reserved.
- RW
0x0 DNTU:
- Drop Non-TCP/UDP over IP Packets. When this bit is set, the MAC drops
the non-TCP or UDP over IP packets. The MAC forward only those packets that are processed by the Layer 4 filter. When this bit is reset, the MAC forwards all non-TCP or UDP over IP packets. When support for
- L2 Virtualized network over L3 Network is enabled, - If VNE=1 and
- VNM=0, all non VxLAN type packets and all non-TCP/UDP type normal
packets are dropped. - If VNE=1 and VNM=1, all non NVGRE type packets and all non-TCP/UDP type normal packets are dropped. - If VNE=0, all non-TCP/UDP type normal packets are dropped. Note: When this bit is set in NVGRE mode (when VNE=1, VNM=1), NVGRE packets (which are also non-TCP/UDP) are not dropped.
- RW
0x0 IPFE:
- Layer 3 and Layer 4 Filter Enable. When this bit is set, the MAC drops
packets that do not match the enabled Layer 3 and Layer 4 filters. If
- Layer 3 or Layer 4 filters are not enabled for matching, this bit does not
have any effect. When this bit is reset, the MAC forwards all packets irrespective of the match status of the Layer 3 and Layer 4 fields. 19:17
- RO
0x0 Reserved_19_17: Reserved.
- RW
0x0 VTFE:
- VLAN Tag Filter Enable. When this bit is set, the MAC drops the VLAN
tagged packets that do not match the VLAN Tag. When this bit is reset, the MAC forwards all packets irrespective of the match status of the VLAN Tag. 15:13
- RO
0x0 Reserved_15_13: Reserved.

10G Ethernet Controller Core Registers
- Bit
R/W
- Reset
- Description

