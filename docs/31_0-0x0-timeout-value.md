# 31 :0 0x0 TIMEOUT_VALUE:

- This timeout value is used only in slave Rx continuous pause mode. This
timeout counter starts on every CS de-assert and resets on next CS assert. On timeout expiry, controller pushes an entry for one (or more) CS boundary(s) into CS_BOUNDARY_STATUS_FIFO. On timeout expiry, controller starts padding (dummy bytes) if data into main RX_FIFO is unaligned to dma_burst_size (which is always 16 in this case)
- SPI_TIMEOUT_BOUNDARY_STATUS_0
- SPI slave Rx continuous pause mode timeout boundary status register
- Offset: 0x1a0
- Read/Write: RO
- Parity Protection: N

- SPI Registers
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

