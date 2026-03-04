# 31 :28 0x0 Reserved_31_28: Reserved. 27:16 0xc ETLNS:

- Egress Timestamp Latency, in nanoseconds This register holds the average
latency in nanoseconds between the actual point (GMII/MII) where the egress timestamp is taken and the output ports (phy_txd_o) of the MAC.
- Ingress correction value is computed as described in the section, "Ingress
Correction". 15:8 0x0 ETLSNS:
- Egress Timestamp Latency, in sub-nanoseconds This register holds the
average latency in sub-nanoseconds between the actual point (GMII/MII) where the egress timestamp is taken and the output ports (phy_txd_o) of the MAC. Ingress correction value is computed as described in the section "Ingress Correction". 7:0 0x0 Reserved_7_0: Reserved.
- EQOS_EQOS_MAC_MAC_PPS_CONTROL_0
PPS Control register. Bits[30:24] of this register are valid only when four Flexible PPS outputs are selected. Bits[22:16] are valid only when three or more Flexible PPS outputs are selected. Bits[14:8] are valid only when two or more Flexible PPS outputs are selected. Bits[6:4] are valid only when Flexible PPS feature is selected.
- Offset: 0xb70
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RO
0x0 Reserved_MCGREN3: Reserved. 30:29
- RO
0x0 Reserved_TRGTMODSEL3: Reserved.

1G Ethernet Controller Core Registers
- Bit
R/W
- Reset
- Description
- RW
0x0 TIMESEL:
- Time Select When this bit is set, 64 bit PTP time is used to capture time at
- MCGR trigger[0] input When this bit is reset, presentation time is used to
capture time at trigger input, maintaining backward compatibility 27:24
- RO
0x0 Reserved_PPSCMD3: Reserved.
- RO
0x0 Reserved_MCGREN2: Reserved. 22:21
- RO
0x0 Reserved_TRGTMODSEL2: Reserved.
- RO
0x0 Reserved_20: Reserved. 19:16
- RO
0x0 Reserved_PPSCMD2: Reserved.
- RW
0x0 MCGREN1:
- MCGR Mode Enable for PPS1 Output This field enables the 1st PPS instance
to operate in PPS or MCGR mode. - 1: Operates in MCGR mode - 0: Operates in
- PPS mode

