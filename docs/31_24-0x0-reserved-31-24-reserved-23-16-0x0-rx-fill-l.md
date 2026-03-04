# 31 :24 0x0 Reserved_31_24: Reserved. 23:16 0x0 RX_FILL_LVL:

- RxDMA Descriptor Cache Fill Level This field gives the fill level of the
- Descriptor Cache for RxDMA Channel 0. A value of 0 implies empty and a
value of 0x10 implies it is full, with 16 descriptors. 15:9 0x0 Reserved_15_9: Reserved. 8:0 0x0 TX_FILL_LVL:
- TxDMA Descriptor Cache Fill Level This field gives the fill level of the
- Descriptor Cache for TxDMA channel 0. A value of 0 implies empty and a
value of 0x10 implies it is full, with 16 descriptors.
- MGBE_DWCXG_DMA_CH9_DMA_CH9_MISS_PACKET_CNT_0
This register has the number of the packets that were dropped by the DMA either due to Bus Error or due to programming the RPF field in the DMA_CH9_Rx_Control register.

10G Ethernet Controller Core Registers cont'd 3
- Offset: 0x35ec
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

