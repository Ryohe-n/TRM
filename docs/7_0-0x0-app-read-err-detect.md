# 7 :0 0x0 APP_READ_ERR_DETECT:

- Application Read Error Detected. The DMA write channel has received an error
response from the AXI bus (or TRGT1 interface when the AXI Bridge is not used) while reading data from it. Each bit corresponds to a DMA channel. Bit [0] corresponds to channel 0. - Enabling: For more details, see "Interrupts and Error
- Handling". - Masking: The DMA write interrupt Mask register has no effect on
this register. - Clearing: You must write a 1'b1 to the corresponding channel bit in the Abort interrupt field of the DMA Write Interrupt Clear Register (DMA_WRITE_INT_CLEAR_OFF) to clear this error bit.
- PCIE_DMA_CAP_PF0_DMA_CAP_DMA_WRITE_DONE_IMWR_LOW_OFF_0
Description: This register holds the lower 32 bits of the Done IMWr TLP address.
- Offset: 0x20060
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

