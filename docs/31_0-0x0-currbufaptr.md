# 31 :0 0x0 CURRBUFAPTR:

- Application Receive Buffer Address Pointer. This field is set to the value of
the address of the first of memory block allocated by software (the address in TDESC) and DMA transferred data from that memory block in normal
- DMA. This field is set to the value of the last address DMA put request on
AXI interface in DMA.

10G Ethernet Controller Core Registers cont'd 3
- MGBE_DWCXG_DMA_CH9_DMA_CH9_STATUS_0
The software driver (application) reads the Status register during interrupt service routine or polling to determine the status of the DMA.
- Offset: 0x35e0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

