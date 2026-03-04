# 64 -bit Tx_Broadcast_Packets_Good_High and

- Tx_Broadcast_Packets_Good_Low counter or 32-bit
- Tx_Broadcast_Packets_Good_Low counter reaches the threshold value
programmed in the MMC control register.

10G Ethernet Controller Core Registers
- Bit
- Reset
- Description
0x0 TXGBPKTIS:
- Tx Good Bad Packet Counter Interrupt Status The bit is set when the 64-bit
- Tx_Packet_Count_Good_Bad_High and Tx_Packet_Count_Good_Bad_Low
counter or 32-bit Tx_Packet_Count_Good_Bad_Low counter reaches the threshold value programmed in the MMC control register. 0x0 TXGBOCTIS:
- Tx Good Bad Octet Counter Interrupt Status The bit is set when the
- Tx_Octet_Count_Good_Bad_High and Tx_Octet_Count_Good_Bad_Low
counter reaches the threshold value programmed in the MMC control register.
- MGBE_DWCXG_CORE_MMC_RECEIVE_INTERRUPT_ENABLE_0
The MMC Receive Interrupt Enable register maintains the enables for the interrupts generated when receive statistic counters reach the threshold value programmed in the MMC Control register. This register is 32 bits wide.
- Offset: 0x80c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 RXPRMMCIE:
- Rx Priority MMC Counter Interrupt Enable Setting this bit enables the
interrupt when the any of Rx Per Priority Counters (0x09D0 to 0x09FC) reaches the threshold value programmed in the MMC control register.
- RO
0x0 Reserved_30: Reserved.
- RO
0x0 Reserved_SGFPIE: Reserved.
- RO
0x0 Reserved_SGPPIE: Reserved.
- RO
0x0 Reserved_RXALEPIE: Reserved.
- RW
0x0 RXLPITRCIE:
- Rx LPI Transition Counter Interrupt Enable Setting this bit enables the
interrupt when Rx_LPI_Tran_Cntr reaches the threshold value programed in the MMC control register.
- RW
0x0 RXLPIUSCIE:
- Rx LPI microsecond Counter Interrupt Enable Setting this bit enables
the interrupt when the Rx_LPI_USEC_Cntr reaches the threshold value programed in the MMC control register.

10G Ethernet Controller Core Registers
- Bit
R/W
- Reset
- Description
- RW
0x0 RXDISOCGBIE:
- Rx Discard Octet Counter Interrupt Enable Setting this bit enables the
interrupt when the Rx_Discard_Octets_Good_Bad_High and
- Rx_Discard_Octets_Good_Bad_Low counter reaches the threshold
value programmed in the MMC control register.
- RW
0x0 RXDISPCGBIE:
- Rx Discard Packet Counter Interrupt Enable Setting this bit enables the
interrupt when the 64-bit Rx_Discard_Packets_Good_Bad_High and
- Rx_Discard_Packets_Good_Bad_Low counter or 32-bit
- Rx_Discard_Packets_Good_Bad_Low counter reaches the threshold
value programmed in the MMC control register.
- RW
0x0 RXWDOGPIE:
- Rx Watchdog Error Packet Counter Interrupt Enable Setting this bit
enables the interrupt when the Rx_Watchdog_Error_Packets counter reaches the threshold value programmed in the MMC control register.
- RW
0x0 RXVLANGBPIE:
- Rx Good Bad VLAN Packet Counter Interrupt Enable Setting this bit
enables the interrupt when the 64-bit
- Rx_VLAN_Packets_Good_Bad_High and
- Rx_VLAN_Packets_Good_Bad_Low counter or 32-bit
- Rx_VLAN_Packets_Good_Bad_Low counter reaches the threshold value
programmed in the MMC control register.
- RW
0x0 RXFOVPIE:
- Rx Queue Overflow Packet Counter Interrupt Enable Setting this bit
enables the interrupt when the 64-bit Rx_FIFOOverflow_Packets_High and Rx_FIFOOverflow_Packets_Low counter or 32-bit
- Rx_FIFOOverflow_Packets_Low counter reaches the threshold value
programmed in the MMC control register.
- RW
0x0 RXPAUSPIE:
- Rx Pause Packet Counter Interrupt Enable Setting this bit enables the
interrupt when the 64-bit Rx_Pause_Packets_High and
- Rx_Pause_Packets_Low counter or 32-bit Rx_Pause_Packets_Low
counter reaches the threshold value programmed in the MMC control register.
- RW
0x0 RXORANGEPIE:
- Rx Out-of-Range Packet Counter Interrupt Enable Setting this bit
enables the interrupt when the 64-bit Rx_OutofRange_Packets_High and Rx_OutofRange_Packets_Low counter or 32-bit
- Rx_OutofRange_Packets_Low counter reaches the threshold value
programmed in the MMC control register.
- RW
0x0 RXLENERPIE:
- Rx Length Error Packet Counter Interrupt Enable Setting this bit
enables the interrupt when the 64-bit Rx_Length_Error_Packets_High and Rx_Length_Error_Packets_Low counter or 32-bit
- Rx_Length_Error_Packets_Low counter reaches the threshold value
programmed in the MMC control register.
- RW
0x0 RXUCGPIE:
- Rx Good Unicast Packet Counter Interrupt Enable Setting this bit
enables the interrupt when the 64-bit Rx_Unicast_Packets_Good_High and Rx_Unicast_Packets_Good_Low counter or 32-bit
- Rx_Unicast_Packets_Good_Low counter reaches the threshold value
programmed in the MMC control register.

10G Ethernet Controller Core Registers
- Bit
R/W
- Reset
- Description
- RW
0x0 RX1024TMAXOCTGBPIE:
- Rx Good Bad 1024-to-Max Octet Size Packet Counter Interrupt Enable
- Setting this bit enables the interrupt when the 64-bit
- Rx_1024ToMaxOctets_Packets_Good_Bad_High and
- Rx_1024ToMaxOctets_Packets_Good_Bad_Low counter or 32-bit
- Rx_1024ToMaxOctets_Packets_Good_Bad_Low counter reaches the
threshold value programmed in the MMC control register.
- RW
0x0 RX512T1023OCTGBPIE:
- Rx Good Bad 512-to-1023 Octet Size Packet Counter Interrupt Enable
- Setting this bit enables the interrupt when the 64-bit
- Rx_512To1023Octets_Packets_Good_Bad_High and
- Rx_512To1023Octets_Packets_Good_Bad_Low counter or 32-bit
- Rx_512To1023Octets_Packets_Good_Bad_Low counter reaches the
threshold value programmed in the MMC control register.
- RW
0x0 RX256T511OCTGBPIE:
- Rx Good Bad 256-to-511 Octet Size Packet Counter Interrupt Enable
- Setting this bit enables the interrupt when the 64-bit
- Rx_256To511Octets_Packets_Good_Bad_High and
- Rx_256To511Octets_Packets_Good_Bad_Low counter or 32-bit
- Rx_256To511Octets_Packets_Good_Bad_Low counter reaches the
threshold value programmed in the MMC control register.
- RW
0x0 RX128T255OCTGBPIE:
- Rx Good Bad 128-to-255 Octet Size Packet Counter Interrupt Enable
- Setting this bit enables the interrupt when the 64-bit
- Rx_128To255Octets_Packets_Good_Bad_High and
- Rx_128To255Octets_Packets_Good_Bad_Low counter or 32-bit
- Rx_128To255Octets_Packets_Good_Bad_Low counter reaches the
threshold value programmed in the MMC control register.
- RW
0x0 RX65T127OCTGBPIE:
- Rx Good Bad 65-to-127 Octet Size Packet Counter Interrupt Enable
- Setting this bit enables the interrupt when the 64-bit
- Rx_65To127Octets_Packets_Good_Bad_High and
- Rx_65To127Octets_Packets_Good_Bad_Low counter or 32-bit
- Rx_65To127Octets_Packets_Good_Bad_Low counter reaches the
threshold value programmed in the MMC control register.
- RW
0x0 RX64OCTGBPIE:
- Rx Good Bad 64 Octet Size Packet Counter Interrupt Enable Setting
this bit enables the interrupt when the 64-bit
- Rx_64Octets_Packets_Good_Bad_High and
- Rx_64Octets_Packets_Good_Bad_Low counter or 32-bit
- Rx_64Octets_Packets_Good_Bad_Low counter reaches the threshold
value programmed in the MMC control register.
- RW
0x0 RXOSIZEGPIE:
- Rx Good Oversize Packet Counter Interrupt Enable Setting this bit
enables the interrupt when the Rx_Oversize_Packets_Good counter reaches the threshold value programmed in the MMC control register.
- RW
0x0 RXUSIZEGPIE:
- Rx Good Undersize Packet Counter Interrupt Enable Setting this bit
enables the interrupt when the Rx_Undersize_Packets_Good counter reaches the threshold value programmed in the MMC control register.
- RW
0x0 RXJABERPIE:
- Rx Jabber Error Packet Counter Interrupt Enable Setting this bit
enables the interrupt when the Rx_Jabber_Error_Packets counter reaches the threshold value programmed in the MMC control register.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 RXRUNTPIE:
- Rx Runt Error Packet Counter Interrupt Enable Setting this bit enables
the interrupt when the Rx_Runt_Error_Packets counter reaches the threshold value programmed in the MMC control register.
- RW
0x0 RXCRCERPIE:
- Rx CRC Error Packet Counter Interrupt Enable Setting this bit enables
the interrupt when the 64-bit Rx_CRC_Error_Packets_High and
- Rx_CRC_Error_Packets_Low counter or 32-bit
- Rx_CRC_Error_Packets_Low counter reaches the threshold value
programmed in the MMC control register.
- RW
0x0 RXMCGPIE:
- Rx Good Multicast Packet Counter Interrupt Enable Setting this bit
enables the interrupt when the 64-bit
- Rx_Multicast_Packets_Good_High and
- Rx_Multicast_Packets_Good_Low counter or 32-bit
- Rx_Multicast_Packets_Good_Low counter reaches the threshold value
programmed in the MMC control register.
- RW
0x0 RXBCGPIE:
- Rx Good Broadcast Packet Counter Interrupt Enable Setting this bit
enables the interrupt when the 64-bit
- Rx_Broadcast_Packets_Good_High and
- Rx_Broadcast_Packets_Good_Low counter or 32-bit
- Rx_Broadcast_Packets_Good_Low counter reaches the threshold value
programmed in the MMC control register.
- RW
0x0 RXGOCTIE:
- Rx Good Octet Counter Interrupt Enable Setting this bit enables the
interrupt when the Rx_Octet_Count_Good_High and
- Rx_Octet_Count_Good_Lo counter reaches the threshold value
programmed in the MMC control register.
- RW
0x0 RXGBOCTIE:
- Rx Good Bad Octet Counter Interrupt Enable Setting this bit enables
the interrupt when the Rx_Octet_Count_Good_Bad_High and
- Rx_Octet_Count_Good_Bad_Low counter reaches the threshold value
programmed in the MMC control register.
- RW
0x0 RXGBPKTIE:
- Rx Good Bad Packet Counter Interrupt Enable Setting this bit enables
the interrupt when the 64-bit Rx_Packet_Count_Good_Bad_High and
- Rx_Packet_Count_Good_Bad_Low counter or 32-bit
- Rx_Packet_Count_Good_Bad_Low counter reaches the threshold value
programmed in the MMC control register.
#### 10.8.5.3 10G Ethernet Controller Core Registers cont'd 1
- MGBE_DWCXG_CORE_MMC_TRANSMIT_INTERRUPT_ENABLE_0
The MMC Transmit Interrupt Enable register maintains the enables for the interrupts generated when transmit statistic counters reach the threshold value programmed in the MMC Control register. This register is 32 bits wide.

10G Ethernet Controller Core Registers cont'd 1
- Offset: 0x810
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 TXPRMMCIE:
- Tx Priority MMC Counter Interrupt Enable Setting this bit enables
the interrupt when the any of Tx Per Priority Counters (0x08D0 to 0x08FC) reaches the threshold value programmed in the MMC control register. 30:27
- RO
0x0 Reserved_30_27: Reserved.
- RO
0x0 Reserved_TXEXDEFPIE: Reserved.
- RO
0x0 Reserved_TXCARERPIE: Reserved.
- RO
0x0 Reserved_TXEXCOLPIE: Reserved.
- RO
0x0 Reserved_TXLATCOLPIE: Reserved.
- RO
0x0 Reserved_TXDEFPIE: Reserved.
- RO
0x0 Reserved_TXMCOLGPIE: Reserved.
- RO
0x0 Reserved_TXSCOLGPIE: Reserved.
- RW
0x0 TXLPITRCIE:
- Tx LPI Transition Counter Interrupt Enable Setting this bit enables
the interrupt when Tx_LPI_Tran_Cntr counter reaches the threshold value programmed in the MMC counter register.
- RW
0x0 TXLPIUSCIE:
- Tx LPI microsecond Counter Interrupt Enable Setting this bit
enables the interrupt when Tx_LPI_USEC_Cntr counter reaches the threshold value programmed in the MMC counter register.
- RW
0x0 TXVLANGPIE:
- Tx Good VLAN Packet Counter Interrupt Enable Setting this bit
enables the interrupt when the 64-bit Tx_VLAN_Packets_Good_High and Tx_VLAN_Packets_Good_Low counter or 32-bit
- Tx_VLAN_Packets_Good_Low reaches the threshold value
programmed in the MMC control register.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 TXPAUSPIE:
- Tx Pause Packet Counter Interrupt Enable Setting this bit enables
the interrupt when the 64-bit Tx_Pause_Packets_High and
- Tx_Pause_Packets_Low counter or 32-bit Tx_Pause_Packets_Low
counter reaches the threshold value programmed in the MMC control register.
- RW
0x0 TXGPKTIE:
- Tx Good Packet Counter Interrupt Enable Setting this bit enables
the interrupt when the 64-bit Tx_Packet_Count_Good_High and
- Tx_Packet_Count_Good_Low counter or 32-bit
- Tx_Packet_Count_Good_Low counter reaches the threshold value
programmed in the MMC control register.
- RW
0x0 TXGOCTIE:
- Tx Good Octet Counter Interrupt Enable Setting this bit enables the
interrupt when the Tx_Octet_Count_Good_High and
- Tx_Octet_Count_Good_Low counter reaches the threshold value
programmed in the MMC control register.
- RW
0x0 TXUFLOWERPIE:
- Tx Underflow Error Packet Counter Interrupt Enable Setting this bit
enables the interrupt when the 64-bit
- Tx_Underflow_Error_Packets_High and
- Tx_Underflow_Error_Packets_Low counter or 32-bit
- Tx_Underflow_Error_Packets_Low counter reaches the threshold
value programmed in the MMC control register.
- RW
0x0 TXBCGBPIE:
- Tx Good Bad Broadcast Packet Counter Interrupt Enable Setting
this bit enables the interrupt when the 64-bit
- Tx_Broadcast_Packets_Good_Bad_High and
- Tx_Broadcast_Packets_Good_Bad_Low counter or 32-bit
- Tx_Broadcast_Packets_Good_Bad_Low counter reaches the
threshold value programmed in the MMC control register.
- RW
0x0 TXMCGBPIE:
- Tx Good Bad Multicast Packet Counter Interrupt Enable Setting this
bit enables the interrupt when the 64-bit
- Tx_Multicast_Packets_Good_Bad_High and
- Tx_Multicast_Packets_Good_Bad_Low counter or 32-bit
- Tx_Multicast_Packets_Good_Bad_Low counter reaches the
threshold value programmed in the MMC control register.
- RW
0x0 TXUCGBPIE:
- Tx Good Bad Unicast Packet Counter Interrupt Enable Setting this
bit enables the interrupt when the 64-bit
- Tx_Unicast_Packets_Good_Bad_High and
- Tx_Unicast_Packets_Good_Bad_Low counter or 32-bit
- Tx_Unicast_Packets_Good_Bad_Low counter reaches the threshold
value programmed in the MMC control register.
- RW
0x0 TX1024TMAXOCTGBPIE:
- Tx Good Bad 1024-to-Max Octet Size Packet Counter Interrupt
- Enable Setting this bit enables the interrupt when the 64-bit
- Tx_1024ToMaxOctets_Packets_Good_Bad_High and
- Tx_1024ToMaxOctets_Packets_Good_Bad_Low counter or 32-bit
- Tx_1024ToMaxOctets_Packets_Good_Bad_Low counter reaches the
threshold value programmed in the MMC control register.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 TX512T1023OCTGBPIE:
- Tx Good Bad 512-to-1023 Octet Size Packet Counter Interrupt
- Enable Setting this bit enables the interrupt when the 64-bit
- Tx_512To1023Octets_Packets_Good_Bad_High and
- Tx_512To1023Octets_Packets_Good_Bad_Low counter or 32-bit
- Tx_512To1023Octets_Packets_Good_Bad_Low counter reaches the
threshold value programmed in the MMC control register.
- RW
0x0 TX256T511OCTGBPIE:
- Tx Good Bad 256-to-511 Octet Size Packet Counter Interrupt
- Enable Setting this bit enables the interrupt when the 64-bit
- Tx_256To511Octets_Packets_Good_Bad_High and
- Tx_256To511Octets_Packets_Good_Bad_Low counter or 32-bit
- Tx_256To511Octets_Packets_Good_Bad_Low counter reaches the
threshold value programmed in the MMC control register.
- RW
0x0 TX128T255OCTGBPIE:
- Tx Good Bad 128-to-255 Octet Size Packet Counter Interrupt
- Enable Setting this bit enables the interrupt when the 64-bit
- Tx_128To255Octets_Packets_Good_Bad_High and
- Tx_128To255Octets_Packets_Good_Bad_Low counter or 32-bit
- Tx_128To255Octets_Packets_Good_Bad_Low counter reaches the
threshold value programmed in the MMC control register.
- RW
0x0 TX65T127OCTGBPIE:
- Tx Good Bad 65-to-127 Octet Size Packet Counter Interrupt Enable
- Setting this bit enables the interrupt when the 64-bit
- Tx_65To127Octets_Packets_Good_Bad_High and
- Tx_65To127Octets_Packets_Good_Bad_Low counter or 32-bit
- Tx_65To127Octets_Packets_Good_Bad_Low counter reaches the
threshold value programmed in the MMC control register.
- RW
0x0 TX64OCTGBPIE:
- Tx Good Bad 64 Octet Size Packet Counter Interrupt Enable Setting
this bit enables the interrupt when the 64-bit
- Tx_64Octets_Packets_Good_Bad_High and
- Tx_64Octets_Packets_Good_Bad_Low counter or 32-bit
- Tx_64Octets_Packets_Good_Bad_Low counter reaches the
threshold value programmed in the MMC control register.
- RW
0x0 TXMCGPIE:
- Tx Good Multicast Packet Counter Interrupt Enable Setting this bit
enables the interrupt when the 64-bit
- Tx_Multicast_Packets_Good_High and
- Tx_Multicast_Packets_Good_Low counter or 32-bit
- Tx_Multicast_Packets_Good_Low counter reaches the threshold
value programmed in the MMC control register.
- RW
0x0 TXBCGPIE:
- Tx Good Broadcast Packet Counter Interrupt Enable Setting this bit
enables the interrupt when the 64-bit
- Tx_Broadcast_Packets_Good_High and
- Tx_Broadcast_Packets_Good_Low counter or 32-bit
- Tx_Broadcast_Packets_Good_Low counter reaches the threshold
value programmed in the MMC control register.
- RW
0x0 TXGBPKTIE:
- Tx Good Bad Packet Counter Interrupt Enable Setting this bit
enables the interrupt when the 64-bit
- Tx_Packet_Count_Good_Bad_High and
- Tx_Packet_Count_Good_Bad_Low counter or 32-bit
- Tx_Packet_Count_Good_Bad_Low counter reaches the threshold
value programmed in the MMC control register.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 TXGBOCTIE:
- Tx Good Bad Octet Counter Interrupt Enable Setting this bit enables
the interrupt when the Tx_Octet_Count_Good_Bad_High and
- Tx_Octet_Count_Good_Bad_Low counter reaches the threshold
value programmed in the MMC control register.
- MGBE_DWCXG_CORE_TX_OCTET_COUNT_GOOD_BAD_LOW_0
This register provides lower 32 bits of transmitted octet count, excluding preamble, in good and bad packets.
- Offset: 0x814
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

