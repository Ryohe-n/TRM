# 11 :10 0x0 Reserved_11_10: Reserved. 0x1 ARPOFFSEL:

- ARP Offload Enabled This bit is set to 1 when the Enable IPv4 ARP
- Offload option is selected
0x1 MMCSEL:
- RMON Module Enable This bit is set to 1 when the Enable MAC
- Management Counters (MMC) option is selected
0x1 MGKSEL:
- PMT Magic Packet Enable This bit is set to 1 when the Enable Magic
- Packet Detection option is selected

1G Ethernet Controller Core Registers
- Bit
- Reset
- Description
0x0
- RWKSEL: Reserved
- PMT Remote Wake-up Packet Enable This bit is set to 1 when the Enable
- Remote Wake-Up Packet Detection option is selected
0x1 SMASEL:
- SMA (MDIO) Interface This bit is set to 1 when the Enable Station
- Management (MDIO Interface) option is selected
0x1 VLHASH:
- VLAN Hash Filter Selected This bit is set to 1 when the Enable VLAN
- Hash Table Based Filtering option is selected
0x0 PCSSEL:
- PCS Registers (TBI, SGMII, or RTBI PHY interface) This bit is set to 1
when the TBI, SGMII, or RTBI PHY interface option is selected 0x1 HDSEL:
- Half-duplex Support This bit is set to 1 when the half-duplex mode is
selected 0x1 GMIISEL: 1000 Mbps Support This bit is set to 1 when 1000 Mbps is selected as the Mode of Operation 0x1 MIISEL: 10 or 100 Mbps Support This bit is set to 1 when 10/100 Mbps is selected as the Mode of Operation
- EQOS_EQOS_MAC_MAC_HW_FEATURE1_0
This register indicates the presence of second set of the optional features or functions of the DWC_ether_qos. The software driver can use this register to dynamically enable or disable the programs related to the optional blocks. Note: All bits are set or reset according to the features selected while configuring the IP in coreConsultant.
- Offset: 0x120
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x429f7a69 (0b0100,0010,1001,1111,0111,1010,0110,1001)
- Bit
- Reset
- Description
0x0 Reserved_31: Reserved. 30:27 0x8 L3L4FNUM:
- Total number of L3 or L4 Filters This field indicates the total number of
L3 or L4 filters: 0x0 Reserved_26: Reserved.

1G Ethernet Controller Core Registers
- Bit
- Reset
- Description

