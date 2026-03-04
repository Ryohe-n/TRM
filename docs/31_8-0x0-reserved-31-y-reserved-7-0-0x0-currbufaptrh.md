# 31 :8 0x0 Reserved_31_y: Reserved. 7:0 0x0 CURRBUFAPTRH:

- Application Receive Buffer Address Pointer. This field is set to the value of
the address of the first of memory block allocated by software (the address in RDESC) and DMA transferred data from that memory block in normal
- DMA. This field is set to the value of the last address DMA put request on
AXI interface in DMA.
- MGBE_DWCXG_DMA_CH9_DMA_CH9_CURRENT_APP_RXBUFFER_L_0
The Channel9 Current Application Receive Buffer Address Low register has the lower 32 bits of the current address of the Receive buffer address read by the DMA.
- Offset: 0x35dc
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

