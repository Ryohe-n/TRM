# 1000 Mbps-only (always 0) configurations, this bit is read-only (RO) with appropriate value. In default 10/100/1000 Mbps configurations, this bit is read-write (R/W). The mac_speed_o[1] signal reflects the value of this bit.

- RW
0x0 FES:
- Speed This bit selects the speed mode. The mac_speed_o[0] signal
reflects the value of this bit.
- RW
0x0 DM:
- Duplex Mode When this bit is set, the MAC operates in the full-duplex
mode in which it can transmit and receive simultaneously. This bit is RO with default value of 1'b1 in the full-duplex-only configurations.
- RW
0x0 LM:
- Loopback Mode When this bit is set, the MAC operates in the loopback
mode at GMII or MII. The (G)MII Rx clock input (clk_rx_i) is required for the loopback to work properly. This is because the Tx clock is not internally looped back.
- RW
0x0 ECRSFD:
- Enable Carrier Sense Before Transmission in Full-Duplex Mode When this
bit is set, the MAC transmitter checks the CRS signal before packet transmission in the full-duplex mode. The MAC starts the transmission only when the CRS signal is low. When this bit is reset, the MAC transmitter ignores the status of the CRS signal.
- RW
0x0 DO:
- Disable Receive Own When this bit is set, the MAC disables the reception
of packets when the gmii_txen_o is asserted in the half-duplex mode.
- When this bit is reset, the MAC receives all packets given by the PHY. This
bit is not applicable in the full-duplex mode.
- RW
0x0 DCRS:
- Disable Carrier Sense During Transmission When this bit is set, the MAC
transmitter ignores the (G)MII CRS signal during packet transmission in the half-duplex mode. As a result, no errors are generated because of
- Loss of Carrier or No Carrier during transmission. When this bit is reset,
the MAC transmitter generates errors because of Carrier Sense. The MAC can even abort the transmission.
- RW
0x0 DR:
- Disable Retry When this bit is set, the MAC attempts only one
transmission. When a collision occurs on the GMII or MII interface, the
- MAC ignores the current packet transmission and reports a Packet Abort
with excessive collision error in the Tx packet status. When this bit is reset, the MAC retries based on the settings of the BL field. This bit is applicable only in the half-duplex mode.

1G Ethernet Controller Core Registers
- Bit
R/W
- Reset
- Description
- RO
0x0 Reserved_7: Reserved. 6:5
- RW
0x0 BL:
- Back-Off Limit The back-off limit determines the random integer number
(r) of slot time delays (4,096 bit times for 1000/2500 Mbps; 512 bit times for 10/100 Mbps) for which the MAC waits before rescheduling a transmission attempt during retries after a collision. n = retransmission attempt. The random integer r takes the value in the range 0 <= r < 2^k This bit is applicable only in the half-duplex mode.
- RW
0x0 DC:
- Deferral Check When this bit is set, the deferral check function is enabled
in the MAC. The MAC issues a Packet Abort status, along with the excessive deferral error bit set in the Tx packet status, when the Tx state machine is deferred for more than 24,288 bit times in 10 or 100 Mbps mode. If the MAC is configured for 1000/2500 Mbps operation, the threshold for deferral is 155,680 bits times. Deferral begins when the transmitter is ready to transmit, but it is prevented because of an active carrier sense signal (CRS) on GMII or MII. The defer time is not cumulative.
- For example, if the transmitter defers for 10,000 bit times because the
- CRS signal is active and the CRS signal becomes inactive, the transmitter
transmits and collision happens. Because of collision, the transmitter needs to back off and then defer again after back off completion. In such a scenario, the deferral timer is reset to 0, and it is restarted. When this bit is reset, the deferral check function is disabled and the MAC defers until the CRS signal goes inactive. This bit is applicable only in the half- duplex mode. 3:2
- RW
0x0 PRELEN:
- Preamble Length for Transmit packets These bits control the number of
preamble bytes that are added to the beginning of every Tx packet. The preamble reduction occurs only when the MAC is operating in the full- duplex mode.
- RW
0x0 TE:
- Transmitter Enable When this bit is set, the Tx state machine of the MAC
is enabled for transmission on the GMII or MII interface. When this bit is reset, the MAC Tx state machine is disabled after it completes the transmission of the current packet. The Tx state machine does not transmit any more packets.
- RW
0x0 RE:
- Receiver Enable When this bit is set, the Rx state machine of the MAC is
enabled for receiving packets from the GMII or MII interface. When this bit is reset, the MAC Rx state machine is disabled after it completes the reception of the current packet. The Rx state machine does not receive any more packets from the GMII or MII interface.
- EQOS_EQOS_MAC_MAC_EXT_CONFIGURATION_0
The MAC Extended Configuration Register establishes the operating mode of the MAC.
- Offset: 0x4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N

1G Ethernet Controller Core Registers
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RO
0x0 Reserved_FHE: Reserved.
- RW
0x0 APDIM:
- ARP Packet Drop if IP Address Mismatch When this bit is set, Packet
for which Target Protocol Address does not match IPv4 address is dropped in the MTL layer. When this bit is reset, when target Protocol
- Address does not match, packet is forwarded to MTL maintaining
backward compatibility 29:25
- RW
0x0 EIPG:
- Extended Inter-Packet Gap The value in this field is applicable when the
- EIPGEN bit is set. This field (as Most Significant bits), along with IPG
field in MAC_Configuration register, gives the minimum IPG greater than 96 bit times in steps of 8 bit times: {EIPG, IPG} 8'h00 - 104 bit times 8'h01 - 112 bit times 8'h02 - 120 bit times ----------------------- 8'hFF - 2144 bit times
- RW
0x0 EIPGEN:
- Extended Inter-Packet Gap Enable When this bit is set, the MAC
interprets EIPG field and IPG field in MAC_Configuration register together as minimum IPG greater than 96 bit times in steps of 8 bit times. When this bit is reset, the MAC ignores EIPG field and interprets
- IPG field in MAC_Configuration register as minimum IPG less than or
equal to 96 bit times in steps of 8 bit times. Note: Enable the extended Inter-Packet Gap feature only when operating in Full-Duplex mode.
- There might be undesirable effects on back-pressure function and
frame transmission if it is enabled in Half-Duplex mode.
- RO
0x0 Reserved_23: Reserved. 22:20
- RW
0x0 HDSMS:
- Maximum Size for Splitting the Header Data These bits indicate the
maximum header size allowed for splitting the header data in the received packet.
- RW
0x0 PDC:
- Packet Duplication Control When this bit is set, the received packet
with Multicast/Broadcast Destination address is routed to multiple
- Receive DMA Channels. The Receive DMA Channels is identified by the
- DCS field of MAC_Address(#i)_High register corresponding to the MAC
- Address register that matches the Multicast/Broadcast Destination
address in the received packet. The DCS field is interpreted to be a one- hot value, each bit corresponding to the Receive DMA Channel. When this bit is reset, the received packet is routed to single Receive DMA
- Channel. The Receive DMA Channel is identified by the DCS field of
- MAC_Address(#i)_High register corresponding to the MAC Address
register that matches the Destination address in the received packet. The DCS field is interpreted as a binary value.
- RW
0x0 USP:
- Unicast Slow Protocol Packet Detect When this bit is set, the MAC
detects the Slow Protocol packets with unicast address of the station specified in the MAC_Address0_High and MAC_Address0_Low registers. The MAC also detects the Slow Protocol packets with the
- Slow Protocols multicast address (01-80-C2-00-00-02). When this bit is
reset, the MAC detects only Slow Protocol packets with the Slow Protocol multicast address specified in the IEEE 802.3-2015, Section 5.

1G Ethernet Controller Core Registers
- Bit
R/W
- Reset
- Description
- RW
0x0 SPEN:
- Slow Protocol Detection Enable When this bit is set, MAC processes the
- Slow Protocol packets (Ether Type 0x8809) and provides the Slow
- Protocol Sub-Type and Code fields in Rx status. When this bit is reset,
the MAC forwards all error-free Slow Protocol packets to the application. The MAC considers such packets as normal Type packets.
- RW
0x0 DCRCC:
- Disable CRC Checking for Received Packets When this bit is set, the
MAC receiver does not check the CRC field in the received packets.
- When this bit is reset, the MAC receiver always checks the CRC field in
the received packets. 15:14
- RO
0x0 Reserved_15_14: Reserved. 13:0
- RW
0x0 GPSL:
- Giant Packet Size Limit If the received packet size is greater than the
value programmed in this field in units of bytes, the MAC declares the received packet as Giant packet. The value programmed in this field must be greater than or equal to 1,518 bytes. Any other programmed value is considered as 1,518 bytes. For VLAN tagged packets, the MAC adds 4 bytes to the programmed value. When the Enable Double VLAN
- Processing option is selected, the MAC adds 8 bytes to the
programmed value for double VLAN tagged packets. The value in this field is applicable when the GPSLCE bit is set in MAC_Configuration register.
- EQOS_EQOS_MAC_MAC_PACKET_FILTER_0
The MAC Packet Filter register contains the filter controls for receiving packets. Some of the controls from this register go to the address check block of the MAC which performs the first level of address filtering. The second level of filtering is performed on the incoming packet based on other controls such as Pass Bad Packets and Pass Control Packets.
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
- Receive All When this bit is set, the MAC Receiver module passes all
received packets to the application, irrespective of whether they pass the address filter or not. The result of the SA or DA filtering is updated (pass or fail) in the corresponding bit in the Rx Status Word. When this bit is reset, the Receiver module passes only those packets to the application that pass the SA or DA address filter. 30:22
- RO
0x0 Reserved_30_22: Reserved.

1G Ethernet Controller Core Registers
- Bit
R/W
- Reset
- Description
- RW
0x0 DNTU:
- Drop Non-TCP/UDP over IP Packets When this bit is set, the MAC
drops the non-TCP or UDP over IP packets. The MAC forward only those packets that are processed by the Layer 4 filter. When this bit is reset, the MAC forwards all non-TCP or UDP over IP packets.
- RW
0x0 IPFE:
- Layer 3 and Layer 4 Filter Enable When this bit is set, the MAC drops
packets that do not match the enabled Layer 3 and Layer 4 filters. If
- Layer 3 or Layer 4 filters are not enabled for matching, this bit does
not have any effect. When this bit is reset, the MAC forwards all packets irrespective of the match status of the Layer 3 and Layer 4 fields. 19:17
- RO
0x0 Reserved_19_17: Reserved.
- RW
0x0 VTFE:
- VLAN Tag Filter Enable When this bit is set, the MAC drops the VLAN
tagged packets that do not match the VLAN Tag. When this bit is reset, the MAC forwards all packets irrespective of the match status of the VLAN Tag. 15:11
- RO
0x0 Reserved_15_11: Reserved.
- RW
0x0 HPF:
- Hash or Perfect Filter When this bit is set, the address filter passes a
packet if it matches either the perfect filtering or hash filtering as set by the HMC or HUC bit. When this bit is reset and the HUC or HMC bit is set, the packet is passed only if it matches the Hash filter.
- RW
0x0 SAF:
- Source Address Filter Enable When this bit is set, the MAC compares
the SA field of the received packets with the values programmed in the enabled SA registers. If the comparison fails, the MAC drops the packet. When this bit is reset, the MAC forwards the received packet to the application with updated SAF bit of the Rx Status depending on the SA address comparison. Note: According to the IEEE specification,
- Bit 47 of the SA is reserved. However, in DWC_ether_qos, the MAC
compares all 48 bits. The software driver should take this into consideration while programming the MAC address registers for SA.
- RW
0x0 SAIF:
- SA Inverse Filtering When this bit is set, the Address Check block
operates in the inverse filtering mode for SA address comparison. If the SA of a packet matches the values programmed in the SA registers, it is marked as failing the SA Address filter. When this bit is reset, if the SA of a packet does not match the values programmed in the SA registers, it is marked as failing the SA Address filter. 7:6
- RW
0x0 PCF:
- Pass Control Packets These bits control the forwarding of all control
packets (including unicast and multicast Pause packets).
- RW
0x0 DBF:
- Disable Broadcast Packets When this bit is set, the AFM module
blocks all the incoming broadcast packets. In addition, it overrides all other filter settings. When this bit is reset, the AFM module passes all received broadcast packets.

1G Ethernet Controller Core Registers
- Bit
R/W
- Reset
- Description
- RW
0x0 PM:
- Pass All Multicast When this bit is set, it indicates that all the received
packets with a multicast destination address (first bit in the destination address field is '1') are passed. When this bit is reset, filtering of multicast packet depends on HMC bit.
- RW
0x0 DAIF:
- DA Inverse Filtering When this bit is set, the Address Check block
operates in inverse filtering mode for the DA address comparison for both unicast and multicast packets. When this bit is reset, normal filtering of packets is performed.
- RW
0x0 HMC:
- Hash Multicast When this bit is set, the MAC performs the destination
address filtering of received multicast packets according to the hash table. When this bit is reset, the MAC performs the perfect destination address filtering for multicast packets, that is, it compares the DA field with the values programmed in DA registers.
- RW
0x0 HUC:
- Hash Unicast When this bit is set, the MAC performs the destination
address filtering of unicast packets according to the hash table. When this bit is reset, the MAC performs a perfect destination address filtering for unicast packets, that is, it compares the DA field with the values programmed in DA registers.
- RW
0x0 PR:
- Promiscuous Mode When this bit is set, the Address Filtering module
passes all incoming packets irrespective of the destination or source address. The SA or DA Filter Fails status bits of the Rx Status Word are always cleared when PR is set.
- EQOS_EQOS_MAC_MAC_WD_JB_TIMEOUT_0
- The Watchdog and Jabber Timeout register controls the watchdog timeout limit for received
packets and jabber timeout limit for transmitted packets.
- Offset: 0xc
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

