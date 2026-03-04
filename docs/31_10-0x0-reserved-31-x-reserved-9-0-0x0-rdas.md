# 31 :10 0x0 Reserved_31_x: Reserved. 9:0 0x0 RDAS:

- Receive DMA Active Status. When the bit is set to 1, the corresponding
- Receive DMA FSMs are not idle, that is, actively processing the descriptors
or packet data. When the bit is set to 0, the corresponding Receive DMA FSMs are in idle state.
- MGBE_DWCXG_DMA_DMA_TX_EDMA_CONTROL_0
The DMA_Tx_EDMA_Control register controls the sequence of all TxDMA operations with the DMA engine.

10G Ethernet Controller Core Registers cont'd 2
- Offset: 0x3040
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

