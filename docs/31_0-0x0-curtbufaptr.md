# 31 :0 0x0 CURTBUFAPTR:

- Application Transmit Buffer Address Pointer. This field is set to the value of
the address of the first of memory block allocated by software (the address in TDESC) and DMA transferred data from that memory block in normal
- DMA. This field is set to the value of the last address DMA put request on
AXI interface in DMA.

10G Ethernet Controller Core Registers cont'd 3
- MGBE_DWCXG_DMA_CH9_DMA_CH9_CURRENT_APP_RXBUFFER_H_0
The Channel9 Current Application Receive Buffer Address High register has the higher 8 or 16 bits of the current address of the Receive buffer address read by the DMA. This register is present only when DWC_xgmac is configured for 40-bit or 48-bit addressing mode.
- Offset: 0x35d8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

