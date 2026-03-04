# 31 :0 0x0 CURTDESAPTR:

- Application Transmit Descriptor Address Pointer. This gives the address of
the Descriptor currently processed by the Normal TxDMA Engine. In DMA, it gives the address of the next descriptor that is going to be fetched from system memory.
- MGBE_DWCXG_DMA_CH9_DMA_CH9_CURRENT_APP_RXDESC_L_0
The Channel9 Current Application Receive Descriptor Low register has the lower 32 bits of the current address of the Receive descriptor read by the DMA. The upper 32 address bits of the Current Receive Descriptor are equal to the value written in the DMA_CH9_RxDesc_List_HAddress. Therefore, the upper address bits are not given in the register map.
- Offset: 0x35cc
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

