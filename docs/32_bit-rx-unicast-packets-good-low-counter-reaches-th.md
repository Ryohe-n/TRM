# 32 -bit Rx_Unicast_Packets_Good_Low counter reaches the threshold value programmed in the MMC control register. 0x0 RX1024TMAXOCTGBPIS:

- Rx Good Bad 1024-to-Max Octet Size Packet Counter Interrupt Status The bit is
set when the 64-bit Rx_1024ToMaxOctets_Packets_Good_Bad_High and
- Rx_1024ToMaxOctets_Packets_Good_Bad_Low counter or 32-bit
- Rx_1024ToMaxOctets_Packets_Good_Bad_Low counter reaches the threshold
value programmed in the MMC control register. 0x0 RX512T1023OCTGBPIS:
- Rx Good Bad 512-to-1023 Octet Size Packet Counter Interrupt Status The bit is
set when the 64-bit Rx_512To1023Octets_Packets_Good_Bad_High and
- Rx_512To1023Octets_Packets_Good_Bad_Low counter or 32-bit
- Rx_512To1023Octets_Packets_Good_Bad_Low counter reaches the threshold
value programmed in the MMC control register. 0x0 RX256T511OCTGBPIS:
- Rx Good Bad 256-to-511 Octet Size Packet Counter Interrupt Status The bit is
set when the 64-bit Rx_256To511Octets_Packets_Good_Bad_High and
- Rx_256To511Octets_Packets_Good_Bad_Low counter or 32-bit
- Rx_256To511Octets_Packets_Good_Bad_Low counter reaches the threshold
value programmed in the MMC control register. 0x0 RX128T255OCTGBPIS:
- Rx Good Bad 128-to-255 Octet Size Packet Counter Interrupt Status The bit is
set when the 64-bit Rx_128To255Octets_Packets_Good_Bad_High and
- Rx_128To255Octets_Packets_Good_Bad_Low counter or 32-bit
- Rx_128To255Octets_Packets_Good_Bad_Low counter reaches the threshold
value programmed in the MMC control register.

10G Ethernet Controller Core Registers
- Bit
- Reset
- Description
0x0 RX65T127OCTGBPIS:
- Rx Good Bad 65-to-127 Octet Size Packet Counter Interrupt Status The bit is
set when the 64-bit Rx_65To127Octets_Packets_Good_Bad_High and
- Rx_65To127Octets_Packets_Good_Bad_Low counter or 32-bit
- Rx_65To127Octets_Packets_Good_Bad_Low counter reaches the threshold
value programmed in the MMC control register. 0x0 RX64OCTGBPIS:
- Rx Good Bad 64 Octet Size Packet Counter Interrupt Status The bit is set when
the 64-bit Rx_64Octets_Packets_Good_Bad_High and
- Rx_64Octets_Packets_Good_Bad_Low counter or 32-bit
- Rx_64Octets_Packets_Good_Bad_Low counter reaches the threshold value
programmed in the MMC control register. 0x0 RXOSIZEGPIS:
- Rx Good Oversize Packet Counter Interrupt Status The bit is set when the
- Rx_Oversize_Packets_Good counter reaches the threshold value programmed in
the MMC control register. 0x0 RXUSIZEGPIS:
- Rx Good Undersize Packet Counter Interrupt Status The bit is set when the
- Rx_Undersize_Packets_Good counter reaches the threshold value programmed
in the MMC control register. 0x0 RXJABERPIS:
- Rx Jabber Error Packet Counter Interrupt Status The bit is set when the
- Rx_Jabber_Error_Packets counter reaches the threshold value programmed in
the MMC control register. 0x0 RXRUNTPIS:
- Rx Runt Error Packet Counter Interrupt Status This bit is set when the
- Rx_Runt_Error_Packets counter reaches the threshold value programmed in the
MMC control register. 0x0 RXCRCERPIS:
- Rx CRC Error Packet Counter Interrupt Status The bit is set when the 64-bit
- Rx_CRC_Error_Packets_High and Rx_CRC_Error_Packets_Low counter or 32-bit
- Rx_CRC_Error_Packets_Low reaches the threshold value programmed in the
MMC control register. 0x0 RXMCGPIS:
- Rx Good Multicast Packet Counter Interrupt Status The bit is set when the 64-
bit Rx_Multicast_Packets_Good_High and Rx_Multicast_Packets_Good_Low counter or 32-bit Rx_Multicast_Packets_Good_Low counter reaches the threshold value programmed in the MMC control register. 0x0 RXBCGPIS:
- Rx Good Broadcast Packet Counter Interrupt Status The bit is set when the 64-
bit Rx_Broadcast_Packets_Good_High and Rx_Broadcast_Packets_Good_Low counter or 32-bit Rx_Broadcast_Packets_Good_Low counter reaches the threshold value programmed in the MMC control register. 0x0 RXGOCTIS:
- Rx Good Octet Counter Interrupt Status The bit is set when the
- Rx_Octet_Count_Good_High and Rx_Octet_Count_Good_Low counter reaches
the threshold value programmed in the MMC control register. 0x0 RXGBOCTIS:
- Rx Good Bad Octet Counter Interrupt Status The bit is set when the
- Rx_Octet_Count_Good_Bad_High and Rx_Octet_Count_Good_Bad_Low counter
reaches the threshold value programmed in the MMC control register.

10G Ethernet Controller Core Registers
- Bit
- Reset
- Description
0x0 RXGBPKTIS:
- Rx Good Bad Packet Counter Interrupt Status The bit is set when the 64-bit
- Rx_Packet_Count_Good_Bad_High and Rx_Packet_Count_Good_Bad_Low
counter or 32-bit Rx_Packet_Count_Good_Bad_Low counter reaches the threshold value programmed in the MMC control register.
- MGBE_DWCXG_CORE_MMC_TX_INTERRUPT_0
The MMC Transmit Interrupt Status register maintains the interrupts generated when the transmit statistic counters reach the threshold value programmed in MMC control register (for example, the counter's MSB is set). This register is 32 bits wide. When the MMC counter that caused the interrupt is read, the corresponding interrupt status bit is cleared. The least significant byte lane (bits[7:0]) of the corresponding counter must be read to clear the interrupt status bit. When the MMC module is enabled for 64-bit counter mode, the least significant byte lane (bits[7:0]) of the upper counter must be read to clear the interrupt status bit.
- Offset: 0x808
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 TXPRMMCIS:
- Tx Priority MMC Counter Interrupt Status The bit is set when the any of the
- Tx Per Priority MMC counter (0x08D0 to 0x08FC) reaches the threshold
value programmed in the MMC control register. 30:27 0x0 Reserved_30_27: Reserved. 0x0 Reserved_TXEXDEFPIS: Reserved. 0x0 Reserved_TXCARERPIS: Reserved. 0x0 Reserved_TXEXCOLPIS: Reserved. 0x0 Reserved_TXLATCOLPIS: Reserved. 0x0 Reserved_TXDEFPIS: Reserved. 0x0 Reserved_TXMCOLGPIS: Reserved.

10G Ethernet Controller Core Registers
- Bit
- Reset
- Description
0x0 Reserved_TXSCOLGPIS: Reserved. 0x0 TXLPITRCIS:
- Tx LPI Transition Counter Interrupt Status This bit is set when the
- Tx_LPI_Tran_Cntr counter reaches the threshold value programmed in the
MMC counter register. 0x0 TXLPIUSCIS:
- Tx LPI microsecond Counter Interrupt Status This bit is set when the
- Tx_LPI_USEC_Cntr counter reaches the threshold value programmed in the
MMC counter register. 0x0 TXVLANGPIS:
- Tx Good VLAN Packet Counter Interrupt Status The bit is set when the 64-
bit Tx_VLAN_Packets_Good_High and Tx_VLAN_Packets_Good_Low counter or 32-bit Tx_VLAN_Packets_Good_Low counter reaches the threshold value programmed in the MMC control register. 0x0 TXPAUSPIS:
- Tx Pause Packet Counter Interrupt Status The bit is set when the 64-bit
- Tx_Pause_Packets_High and Tx_Pause_Packets_Low counter or 32-bit
- Tx_Pause_Packets_Low counter reaches the threshold value programmed in
the MMC control register. 0x0 TXGPKTIS:
- Tx Good Packet Counter Interrupt Status The bit is set when the 64-bit
- Tx_Packet_Count_Good_High and Tx_Packet_Count_Good_Low counter or

