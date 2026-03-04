# 31 :0 0x0 SRC_ADDR_REG_LOW:

- Source Address Register (lower 32 bits). Indicates the next address to be read
from. The DMA increments the SAR as the DMA transfer progresses. In LL mode, the DMA overwrites this with the corresponding dword of the LL element. - DMA Read: The SAR is the address of the remote memory. - DMA
- Write: The SAR is the address of the local memory. Note: The access attributes
of this field are as follows: - Wire: No access. - Dbi: R/W
- PCIE_DMA_CAP_PF0_DMA_CAP_DMA_SAR_HIGH_OFF_WRCH_3_0
Description: This register holds the higher 32 bits of the Source Address Register (SAR).
- Offset: 0x20810
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- PCIe iATU
- Bit
- Reset
- Description

