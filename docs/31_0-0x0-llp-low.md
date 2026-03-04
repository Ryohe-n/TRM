# 31 :0 0x0 LLP_LOW:

- Lower bits of the address of the linked list transfer list in local memory. Used in
linked list mode only. Updated by the DMA to point to the next element in the transfer list after the previous element is consumed. - When the current element is a data element; this field is incremented by 6 DWORDS. - When the current element is a link element; this field is overwritten by the LL Element
- Pointer of the element. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: R/W
- PCIE_DMA_CAP_PF0_DMA_CAP_DMA_LLP_HIGH_OFF_WRCH_3_0
Description: This register holds the higher 32 bits of the DMA write linked list pointer.
- Offset: 0x20820
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

