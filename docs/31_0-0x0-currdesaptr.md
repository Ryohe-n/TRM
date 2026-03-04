# 31 :0 0x0 CURRDESAPTR:

- Application Receive Descriptor Address Pointer. This gives the address of
the Descriptor currently processed by the Normal RxDMA Engine. In DMA, it gives the address of the next descriptor that is going to be fetched from system memory.

10G Ethernet Controller Core Registers cont'd 3
- MGBE_DWCXG_DMA_CH9_DMA_CH9_CURRENT_APP_TXBUFFER_H_0
The Channel9 Current Application Transmit Buffer Address High register has the higher 8 or 16 bits of the current address of the Transmit buffer address read by the DMA. This register is present only when DWC_xgmac is configured for 40-bit or 48-bit addressing mode.
- Offset: 0x35d0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

