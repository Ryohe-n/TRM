# 31 :18 0x0 Reserved_31_18: Reserved. 0x0 MACIS:

- MAC Interrupt Status. This bit indicates an interrupt event in the MAC. To
reset this bit to 1'b0, the software must read the corresponding register in the MAC to get the exact cause of the interrupt and clear its source. 0x0 MTLIS:
- MTL Interrupt Status. This bit indicates an interrupt event in the MTL. To
reset this bit to 1'b0, the software must read the corresponding register in the MTL to get the exact cause of the interrupt and clear its source. 15:8 0x0 DC15TC8IS:
- DMA Channel 15 Interrupt Status to DMA Channel 8 Interrupt Status. To
reset a bit to 1'b0, the software must read the Channel Status register in the corresponding DMA Channel (15 to 8) to get the exact cause of the interrupt and clear its source. 0x0 DC7IS:
- DMA Channel 7 Interrupt Status. This bit indicates an interrupt event in
- DMA Channel 7. To reset this bit to 1'b0, the software must read the
corresponding register in DMA Channel 7 to get the exact cause of the interrupt and clear its source. 0x0 DC6IS:
- DMA Channel 6 Interrupt Status. This bit indicates an interrupt event in
- DMA Channel 6. To reset this bit to 1'b0, the software must read the
corresponding register in DMA Channel 6 to get the exact cause of the interrupt and clear its source. 0x0 DC5IS:
- DMA Channel 5 Interrupt Status. This bit indicates an interrupt event in
- DMA Channel 5. To reset this bit to 1'b0, the software must read the
corresponding register in DMA Channel 5 to get the exact cause of the interrupt and clear its source. 0x0 DC4IS:
- DMA Channel 4 Interrupt Status. This bit indicates an interrupt event in
- DMA Channel 4. To reset this bit to 1'b0, the software must read the
corresponding register in DMA Channel 4 to get the exact cause of the interrupt and clear its source.

10G Ethernet Controller Core Registers cont'd 2
- Bit
- Reset
- Description
0x0 DC3IS:
- DMA Channel 3 Interrupt Status. This bit indicates an interrupt event in
- DMA Channel 3. To reset this bit to 1'b0, the software must read the
corresponding register in DMA Channel 3 to get the exact cause of the interrupt and clear its source. 0x0 DC2IS:
- DMA Channel 2 Interrupt Status. This bit indicates an interrupt event in
- DMA Channel 2. To reset this bit to 1'b0, the software must read the
corresponding register in DMA Channel 2 to get the exact cause of the interrupt and clear its source. 0x0 DC1IS:
- DMA Channel 1 Interrupt Status. This bit indicates an interrupt event in
- DMA Channel 1. To reset this bit to 1'b0, the software must read the
corresponding register in DMA Channel 1 to get the exact cause of the interrupt and clear its source. 0x0 DC0IS:
- DMA Channel 0 Interrupt Status. This bit indicates an interrupt event in
- DMA Channel 0. To reset this bit to 1'b0, the software must read the
corresponding register in DMA Channel 0 to get the exact cause of the interrupt and clear its source.
- MGBE_DWCXG_DMA_AXI_TX_AR_ACE_CONTROL_0
This register is used to control the AXI4 Cache Coherency Signals for read transactions by all the Transmit DMA channels. The following signals of the AXI4 interface are driven with different values as programmed for corresponding type (descriptor, buffer1, buffer2) of access. - arcache_m_o[3:0]
- ardomain_m_o[1:0].
- Offset: 0x3010
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

