# 24 :23 0x0 Reserved_PHYSEL: Reserved. 22:18 0x1f ADDMACADRSEL:

- MAC Addresses 1-31 Selected. This field gives the number of additional
- MAC addresses selected using the Enable Additional 1-31 MAC Address
Registers option. 0x0 Reserved_17: Reserved. 0x1 RXCOESEL:
- Receive Checksum Offload Enabled. This bit is set to 1 when the Enable
Receive TCP/IP Checksum Check option is selected. 0x0 Reserved_15: Reserved.

10G Ethernet Controller Core Registers
- Bit
- Reset
- Description
0x1 TXCOESEL:
- Transmit Checksum Offload Enabled. This bit is set to 1 when the Enable
Transmit TCP/IP Checksum Offload option is selected. 0x1 EEESEL:
- Energy Efficient Ethernet Enabled. This bit is set to 1 when the Enable
Energy Efficient Ethernet (EEE) option is selected. 0x1 TSSEL:
- IEEE 1588-2008 Timestamp Enabled. This bit is set to 1 when the Enable
IEEE 1588 Timestamp Support option is selected. 0x1 AVSEL:
- AV Feature Enabled. This bit is set to 1 when the Enable Audio Video
Bridging option is selected. 0x0 RAVSEL:
- Rx Side Only AV Feature Enable. This bit is set to 1 when the Enable
Audio Video Bridging option on Rx Side Only is selected. 0x1 ARPOFFSEL:
- ARP Offload Enabled. This bit is set to 1 when the Enable IPv4 ARP
Offload option is selected. 0x1 MMCSEL:
- RMON Module Enable. This bit is set to 1 when the Enable XGMAC
Management Counter (MMC) option is selected. 0x1 MGKSEL:
- PMT Magic Packet Enable. This bit is set to 1 when the Enable Magic
Packet Detection option is selected. 0x1 RWKSEL:
- PMT Remote Wake-up Packet Enable. This bit is set to 1 when the
Enable Remote Wake-Up Packet Detection option is selected. 0x1 SMASEL:
- SMA (MDIO) Interface. This bit is set to 1 when the Enable Station
Management Block (MDIO Interface) option is selected. 0x1 VLHASH:
- VLAN Hash Filter Selected. This bit is set to 1 when the Enable Address
Filter VLAN Hash Table option is selected. 0x0 HDSEL:
- Half-duplex Support This bit is set to 1 when the half-duplex mode is
selected. 0x0 RMIISEL:
- RMII Support. This bit is set to 1 when the RMII Interface option is
selected. 0x0 GMIISEL: 1000/100/10 Mbps Support. This bit is set to 1 when the GMII Interface option is selected. 0x0 RGMIISEL:
- RGMII Support. This bit is set to 1 when the RGMII Interface option is
selected.

10G Ethernet Controller Core Registers
- MGBE_DWCXG_CORE_MAC_HW_FEATURE1_0
This register indicates the presence of second set of the optional features or functions of
- DWC_xgmac. The software driver can use this register to dynamically enable or disable the
programs related to the optional blocks.
- Offset: 0x120
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x52ff7aeb (0b0101,0010,1111,1111,0111,1010,1110,1011)
- Bit
- Reset
- Description
0x0 Reserved_31: Reserved. 30:27 0xa L3L4FNUM:
- Total number of L3 or L4 Filters. This field indicates the total number of L3 or
- L4 filters: - 4'b0000: No L3 or L4 Filter - 4'b0001: 1 L3 or L4 Filter - 4'b0010: 2
- L3 or L4 Filters - ... - 4'b1000: 8 L3 or L4 - 4'b1001: 16 L3 or L4 - 4'b1010: 32
- L3 or L4

