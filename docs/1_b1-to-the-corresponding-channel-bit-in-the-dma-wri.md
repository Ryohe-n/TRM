# 1 'b1 to the corresponding channel bit in the DMA write interrupt Clear register to clear this interrupt bit. Note: You can write to this register to emulate interrupt generation, during software or hardware testing. A write to the address triggers an interrupt, but the DMA does not set the Done or Abort bits in this register. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W 15:8

- RO
0x0 RSVDP_8: Reserved for future use. 7:0
- RW
0x0 WR_DONE_INT_STATUS:
- Done Interrupt Status. The DMA write channel has successfully
completed the DMA transfer. For more details, see "Interrupts and Error
- Handling". Each bit corresponds to a DMA channel. Bit [0] corresponds
to channel 0. - Enabling: For more details, see "Interrupts and Error
- Handling". - Masking: The DMA write interrupt Mask register has no
effect on this register. - Clearing: You must write a 1'b1 to the corresponding channel bit in the DMA write interrupt Clear register to clear this interrupt bit. Note: You can write to this register to emulate interrupt generation, during software or hardware testing. A write to the address triggers an interrupt, but the DMA does not set the Done or Abort bits in this register. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W

- PCIe iATU
- PCIE_DMA_CAP_PF0_DMA_CAP_DMA_WRITE_INT_MASK_OFF_0
Description: This register holds the Abort and Done DMA write interrupt mask.
- Offset: 0x20054
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x000f000f (0b0000,0000,xxxx,1111,0000,0000,xxxx,1111)
- Bit
R/W
- Reset
- Description

