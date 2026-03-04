# 5 :3 0x0 TDXS:

- TxDMA Data Transfer FSM State - 'x0: IDLE state - 'x1: Control word writing
state - 'x2: Data transferring state - 'x3: Descriptor Writing Back state - 'x4:
- Writing Timestamp correction field state (Reserved if Data Width is greater
than 64) - 'x5-'x7: Reserved 2:0 0x0 TDFS:
- TxDMA Descriptor Fetch FSM State - 'x0: STOP/IDLE State - 'x1: Requesting for
- Descriptor Read state - 'x2: Reading the Descriptor & writing into Descriptor
- Cache state - 'x3: SUSPEND state - 'x4: ERROR state - 'x5: Waiting for
- Descriptor data transfer complete after OWN bit error - 'x6: Start Read
descriptor with OWN bit not set again - 'x7: Reserved
- MGBE_DWCXG_DMA_CH9_DMA_CH9_DESC_MEM_CACHE_FILL_LEVEL_0
The DMA Channel0 Descriptor Cache Fill Level Status register.
- Offset: 0x35e8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

