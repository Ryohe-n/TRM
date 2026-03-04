# 31 :0 0x0 RXJABERR:

- Rx Jabber Error Packets This field indicates the number of giant packets
received with length (including CRC) greater than 1,518 bytes (1,522 bytes for VLAN tagged) and with CRC error. If Jumbo Packet mode is enabled, packets of length greater than 9,018 bytes (9,022 bytes for VLAN tagged) are considered as giant packets.
- EQOS_EQOS_MAC_RX_UNDERSIZE_PACKETS_GOOD_0
This register provides the number of packets received by DWC_ether_qos with length less than 64 bytes, without any errors.
- Offset: 0x7a4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

