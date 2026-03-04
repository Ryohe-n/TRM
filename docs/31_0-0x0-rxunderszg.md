# 31 :0 0x0 RXUNDERSZG:

- Rx Undersize Packets Good This field indicates the number of packets
received with length less than 64 bytes, without any errors.
- EQOS_EQOS_MAC_RX_OVERSIZE_PACKETS_GOOD_0
This register provides the number of packets received by DWC_ether_qos without errors, with length greater than the maxsize (1,518 bytes or 1,522 bytes for VLAN tagged packets; 2000 bytes if enabled in the S2KP bit of the MAC_Configuration register).
- Offset: 0x7a8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

