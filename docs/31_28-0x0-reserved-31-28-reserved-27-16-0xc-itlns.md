# 31 :28 0x0 Reserved_31_28: Reserved. 27:16 0xc ITLNS:

- Ingress Timestamp Latency, in sub-nanoseconds This register holds the
average latency in sub-nanoseconds between the input ports (phy_rxd_i) of MAC and the actual point (GMII/MII) where the ingress timestamp is taken.
- Ingress correction value is computed as described in the section, "Ingress
Correction". 15:8 0x0 ITLSNS:
- Ingress Timestamp Latency, in nanoseconds This register holds the average
latency in nanoseconds between the input ports (phy_rxd_i) of MAC and the actual point (GMII/MII) where the ingress timestamp is taken. Ingress correction value is computed as described in the section, "Ingress Correction". 7:0 0x0 Reserved_7_0: Reserved.
- EQOS_EQOS_MAC_MAC_TIMESTAMP_EGRESS_LATENCY_0
This register holds the Egress MAC latency.

1G Ethernet Controller Core Registers
- Offset: 0xb6c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x000c0000 (0b0000,0000,0000,1100,0000,0000,0000,0000)
- Bit
- Reset
- Description

