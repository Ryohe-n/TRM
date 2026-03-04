# 31 :0 0x0 DMA_TRANSFER_SIZE: DMA Transfer Size. You program this register with the size of the DMA transfer.

- The maximum DMA transfer size is 4Gbytes. The minimum transfer size is one
byte (0x1). This field is automatically decremented by the DMA as the DMA write channel transfer progresses. This field indicates the number bytes remaining to be transferred. When all bytes are successfully transferred the current transfer size is zero. In LL mode, the DMA overwrites this register with the corresponding dword of the LL element. You can read this register to monitor the transfer progress, however in some scenarios this register is updated after a delay. For example, when less than 3 channels are doorbelled, this register is updated only after a descriptor finishes(linked list mode), or the transfer ends (non-linked list mode). Note: The access attributes of this field are as follows: - Wire: No access. -
- Dbi: R/W
- PCIE_DMA_CAP_PF0_DMA_CAP_DMA_SAR_LOW_OFF_WRCH_3_0
Description: This register holds the lower 32 bits of the Source Address Register (SAR).
- Offset: 0x2080c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

