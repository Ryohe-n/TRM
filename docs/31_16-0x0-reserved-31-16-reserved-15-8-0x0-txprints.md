# 31 :16 0x0 Reserved_31_16: Reserved. 15:8 0x0 TXPRINTS:

- Tx Per Priority MMC Counter Interrupt Status The interrupt status
corresponding to Per Priority Tx MMC Counters (0x08D0 to 0x08FC). Each bit indicates whether the corresponding priority has an Interrupt. 7:0 0x0 RXPRINTS:
- Rx Per Priority MMC Counter Interrupt Status The interrupt status
corresponding to Per Priority Rx MMC Counters (0x09D0 to 0x09FC). Each bit indicates whether the corresponding priority has an Interrupt.

10G Ethernet Controller Core Registers cont'd 1
- MGBE_DWCXG_CORE_TX_PER_PRIORITY_STATUS_0
This register indicates which Tx Per Priority Counters of the selected priority (PRMMCSEL field of MMC Control register) had an interrupt.
- Offset: 0x8d0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

