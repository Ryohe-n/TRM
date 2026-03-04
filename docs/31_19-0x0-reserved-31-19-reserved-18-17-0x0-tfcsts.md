# 31 :19 0x0 Reserved_31_19: Reserved. 18:17 0x0 TFCSTS:

- MAC Transmit Packet Controller Status. This field indicates the state of the
- MAC Transmit Packet Controller module: - 2'b00: Idle state - 2'b01: Waiting
for one of the following: -- Status of the previous packet or -- IPG period to be over - 2'b10: Generating and transmitting a Pause control packet - 2'b11:
- Transferring input packet for transmission
0x0 TPESTS:
- MAC GMII or XGMII Transmit Protocol Engine Status. When this bit is set, it
indicates that the MAC GMII or XGMII transmit protocol engine is actively transmitting data, and it is not in the Idle state. 15:3 0x0 Reserved_15_3: Reserved. 2:1 0x0 RFCFCSTS:
- MAC Receive Packet Controller FIFO Status. This field indicates the active
state of the small FIFO Read and Write controllers of the MAC Receive
- Packet Controller module. When bit 2 is set, small FIFO Read controller is
active. When bit 1 is set, small FIFO Write controller is active. 0x0 RPESTS:
- MAC, GMII, or XGMII Receive Protocol Engine Status. When this bit is set, it
indicates that the MAC, GMII, or XGMII receive protocol engine is actively receiving data, and it is not in the Idle state.

10G Ethernet Controller Core Registers
- MGBE_DWCXG_CORE_MAC_HW_FEATURE0_0
- This register indicates the presence of the first set of optional features or functions of
- DWC_xgmac. The software driver can use this register to dynamically enable or disable the
programs related to the optional blocks.
- Offset: 0x11c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xca7d7bf0 (0b1100,1010,0111,1101,0111,1011,1111,0000)
- Bit
- Reset
- Description
0x1 EDMA:
- Enhanced DMA. This bit is set to 1 when the "Enhanced DMA" option is
selected. 0x1 EDIFFC:
- Different Descriptor Cache. When set to 1, then DMA mode Separate
Memory is selected for the Descriptor Cache. 0x0 VXN:
- VxLAN/NVGRE Support. When set to 1 then the support for VxLAN/
NVGRE is selected. 0x0 Reserved_28: Reserved. 0x1 SAVLANINS:
- Source Address or VLAN Insertion Enable. This bit is set to 1 when the
Enable SA and VLAN Insertion on Tx option is selected. 26:25 0x1 TSSTSSEL:
- Timestamp System Time Source. This bit indicates the source of the
Timestamp system time: - 01: Internal - 10: External - 11: Both - 00:
- Reserved

