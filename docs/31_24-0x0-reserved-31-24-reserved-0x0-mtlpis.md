# 31 :24 0x0 Reserved_31_24: Reserved. 0x0 MTLPIS:

- MTL Rx-Parser Interrupt Status This bit indicates that there is an interrupt
from Rx Parser Block. To reset this bit, the application must read the
- MTL_RXP_Interrupt_Control_Status register to get the exact cause of the
interrupt and clear its source. 22:21 0x0 Reserved_22_21: Reserved. 0x0 Reserved_SGFIS: Reserved. 0x0 TINS:
- TBS Interrupt Status This bit is set when a frame is dropped in any of the
queues in TBS. Access restriction applies. Clears on write of 1. 0x0 ESTIS:
- EST (TAS- IEEE 802.1Qbv) Interrupt Status This bit indicates an interrupt
event during the operation of IEEE 802.1Qbv. To reset this bit, the application must clear the error/event that has caused the interrupt. 0x0 DBGIS:
- Debug Interrupt Status. This bit indicates an interrupt event during the
slave access. To reset this bit, the software must read the FIFO Debug
- Access Status register to get the exact cause of the interrupt and clear its
source. 0x0 MACIS:
- MAC Interrupt Status. This bit indicates an interrupt event in the MAC. To
reset this bit to 1'b0, the software must read the corresponding register in the MAC to get the exact cause of the interrupt and clear its source. 0x0 Q15IS:
- Queue 15 Interrupt Status. This bit indicates that there is an interrupt from
- Queue 15. To reset this bit, the software must read Queue 15 Interrupt
- Control and Status register to get the exact cause of the interrupt and
clear its source. 0x0 Q14IS:
- Queue 14 Interrupt Status. This bit indicates that there is an interrupt from
- Queue 14. To reset this bit, the software must read Queue 14 Interrupt
- Control and Status register to get the exact cause of the interrupt and
clear its source.

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description
0x0 Q13IS:
- Queue 13 Interrupt Status. This bit indicates that there is an interrupt from
- Queue 13. To reset this bit, the software must read Queue 13 Interrupt
- Control and Status register to get the exact cause of the interrupt and
clear its source. 0x0 Q12IS:
- Queue 12 Interrupt Status. This bit indicates that there is an interrupt from
- Queue 12. To reset this bit, the software must read Queue 12 Interrupt
- Control and Status register to get the exact cause of the interrupt and
clear its source. 0x0 Q11IS:
- Queue 11 Interrupt Status. This bit indicates that there is an interrupt from
- Queue 11. To reset this bit, the software must read Queue 11 Interrupt
- Control and Status register to get the exact cause of the interrupt and
clear its source. 0x0 Q10IS:
- Queue 10 Interrupt Status. This bit indicates that there is an interrupt from
- Queue 10. To reset this bit, the software must read Queue 10 Interrupt
- Control and Status register to get the exact cause of the interrupt and
clear its source. 0x0 Q9IS:
- Queue 9 Interrupt Status. This bit indicates that there is an interrupt from
- Queue 9. To reset this bit, the software must read Queue 9 Interrupt
- Control and Status register to get the exact cause of the interrupt and
clear its source. 0x0 Q8IS:
- Queue 8 Interrupt Status. This bit indicates that there is an interrupt from
- Queue 8. To reset this bit, the software must read Queue 8 Interrupt
- Control and Status register to get the exact cause of the interrupt and
clear its source. 0x0 Q7IS:
- Traffic Class/Queue 7 Interrupt Status. This bit indicates that there is an
interrupt from Traffic Class/Queue 7. To reset this bit, the software must read Traffic Class/Queue 7 Interrupt Control and Status register to get the exact cause of the interrupt and clear its source. 0x0 Q6IS:
- Traffic Class/Queue 6 Interrupt Status. This bit indicates that there is an
interrupt from Traffic Class/Queue 6. To reset this bit, the software must read Traffic Class/Queue 6 Interrupt Control and Status register to get the exact cause of the interrupt and clear its source. 0x0 Q5IS:
- Traffic Class/Queue 5 Interrupt Status. This bit indicates that there is an
interrupt from traffic Class/Queue 5. To reset this bit, the software must read traffic Class/Queue 5 Interrupt Control and Status register to get the exact cause of the interrupt and clear its source. 0x0 Q4IS:
- Traffic Class/Queue 4 Interrupt Status. This bit indicates that there is an
interrupt from Traffic Class/Queue 4. To reset this bit, the software must read Traffic Class/Queue 4 Interrupt Control and Status register to get the exact cause of the interrupt and clear its source.

10G Ethernet Controller Core Registers cont'd 1
- Bit
- Reset
- Description
0x0 Q3IS:
- Traffic Class/Queue 3 Interrupt Status. This bit indicates that there is an
interrupt from Traffic Class/Queue 3. To reset this bit, the software must read Traffic Class/Queue 3 Interrupt Control and Status register to get the exact cause of the interrupt and clear its source. 0x0 Q2IS:
- Traffic Class/Queue 2 Interrupt Status. This bit indicates that there is an
interrupt from Traffic Class/Queue 2. To reset this bit, the software must read Traffic Class/Queue 2 Interrupt Control and Status register to get the exact cause of the interrupt and clear its source. 0x0 Q1IS:
- Traffic Class/Queue 1 Interrupt Status. This bit indicates that there is an
interrupt from Traffic Class/Queue 1. To reset this bit, the software must read Traffic Class/Queue 1 Interrupt Control and Status register to get the exact cause of the interrupt and clear its source. 0x0 Q0IS:
- Traffic Class/Queue 0 Interrupt Status. This bit indicates that there is an
interrupt from Traffic Class/Queue 0. To reset this bit, the software must read Traffic Class/Queue 0 Interrupt Control and Status register to get the exact cause of the interrupt and clear its source.
- MGBE_DWCXG_MTL_MTL_RXQ_DMA_MAP0_0
The Receive Queue and DMA Channel Mapping 0 register controls the static or dynamic mapping of Receive Queues 0-3 to Receive DMA Channels.
- Offset: 0x1030
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
0x0 Q3DDMACH:
- Receive Queue 3 Enabled for Dynamic DMA Channel Selection When set,
this bit indicates that each packet received in Receive Queue 3 is routed to a DMA channel as decided in the MAC Receiver based on the DMA channel number programmed in the L3-L4 filter registers, RSS lookup table, the Ethernet DA address registers or VLAN filter registers. When reset, this bit indicates that all packets received in Receive Queue 3 are routed to the DMA Channel programmed in the Q3MDMACH field. 30:28
- RO
0x0 Reserved_30_y: Reserved.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description

