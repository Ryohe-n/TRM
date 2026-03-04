# 31 :8 0x0 Reserved_31_y: Reserved. 7:0 0x0 CURTBUFAPTRH:

- Application Receive Buffer Address Pointer. This field is set to the value of
the address of the first memory block allocated by software (the address in TDESC) and DMA transferred data from that memory block in normal DMA.
- This field is set to the value of the last address DMA put request on AXI
interface in DMA.
- MGBE_DWCXG_DMA_CH9_DMA_CH9_CURRENT_APP_TXBUFFER_L_0
The Channel9 Current Application Transmit Buffer Address Low register has the lower 32 bits of the current address of the Transmit buffer address read by the DMA.
- Offset: 0x35d4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

