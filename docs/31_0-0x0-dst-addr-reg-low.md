# 31 :0 0x0 DST_ADDR_REG_LOW:

- Destination Address Register (lower 32 bits). Indicates the next address to be
written to. The DMA increments the DAR as the DMA transfer progresses. In
- LL mode, the DMA overwrites this with the corresponding dword of the LL
element. - DMA Read: The DAR is the address of the local memory. - DMA
- Write: The DAR is the address of the remote memory. Note: The access
attributes of this field are as follows: - Wire: No access. - Dbi: R/W
- PCIE_DMA_CAP_PF0_DMA_CAP_DMA_DAR_HIGH_OFF_WRCH_3_0
Description: This register holds the higher 32 bits of the Destination Address Register (DAR).
- Offset: 0x20818
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

