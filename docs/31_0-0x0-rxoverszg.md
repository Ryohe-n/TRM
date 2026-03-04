# 31 :0 0x0 RXOVERSZG:

- Rx Oversize Packets Good This field indicates the number of packets
received without errors, with length greater than the maxsize (1,518 bytes or 1,522 bytes for VLAN tagged packets; 2000 bytes if enabled in the S2KP bit of the MAC_Configuration register).

1G Ethernet Controller Core Registers
- EQOS_EQOS_MAC_RX_64OCTETS_PACKETS_GOOD_BAD_0
- This register provides the number of good and bad packets received by DWC_ether_qos with
length 64 bytes, exclusive of the preamble.
- Offset: 0x7ac
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

