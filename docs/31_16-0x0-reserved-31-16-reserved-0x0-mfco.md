# 31 :16 0x0 Reserved_31_16: Reserved. 0x0 MFCO:

- Overflow status of MFC Counter When this bit is set, the MFC counter does
not get incremented further. This bit gets cleared when this register is read. 14:11 0x0 Reserved_14_11: Reserved. 10:0 0x0 MFC:
- Missed Packet Counter This counter indicates the number of packet
counter that were dropped by the DMA either due to Bus Error or due to programming RPF field in DMA_CH9_Rx_Control register. (Refer RPF field of
- DMA_CH9_Rx_Control register for more details.) The counter gets cleared
when this register is read.
- MGBE_DWCXG_DMA_CH9_DMA_CH9_TX_DATA_XFER_RING_OFFSET_0
This register indicates the Offset of the Tx Descriptor List, for which the DMA engine is fetching the data.
- Offset: 0x35f0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

