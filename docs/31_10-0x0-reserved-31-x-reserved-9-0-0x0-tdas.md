# 31 :10 0x0 Reserved_31_x: Reserved. 9:0 0x0 TDAS:

- Transmit DMA Active Status. When the bit is set to 1, the corresponding
- Transmit DMA FSMs are not idle, that is, actively processing the
descriptors or packet data. When the bit is set to 0, the corresponding Transmit DMA FSMs are in idle state.
- MGBE_DWCXG_DMA_DMA_DEBUG_STATUS3_0
The Debug Status3 register gives the per Receive DMA active status.
- Offset: 0x302c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

