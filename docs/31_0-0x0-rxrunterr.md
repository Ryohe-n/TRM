# 31 :0 0x0 RXRUNTERR:

- Rx Runt Error Packets This field indicates the number of packets
received with runt (length less than 64 bytes and CRC error) error.
- EQOS_EQOS_MAC_RX_JABBER_ERROR_PACKETS_0
- This register provides the number of giant packets received by DWC_ether_qos with length
(including CRC) greater than 1,518 bytes (1,522 bytes for VLAN tagged) and with CRC error. If Jumbo Packet mode is enabled, packets of length greater than 9,018 bytes (9,022 bytes for VLAN tagged) are considered as giant packets.
- Offset: 0x7a0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

1G Ethernet Controller Core Registers
- Bit
- Reset
- Description

