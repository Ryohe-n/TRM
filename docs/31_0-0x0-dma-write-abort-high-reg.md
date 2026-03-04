# 31 :0 0x0 DMA_WRITE_ABORT_HIGH_REG:

- The DMA uses this field to generate bits [63:32] of the address field for
the Abort IMWr TLP. Note: The access attributes of this field are as follows:
- Wire: No access. - Dbi: R/W
- PCIE_DMA_CAP_PF0_DMA_CAP_DMA_WRITE_CH01_IMWR_DATA_OFF_0
Description: This register holds the Channel 1 and 0 IMWr Done or Abort TLP Data.
- Offset: 0x20070
- Read/Write: R/W
- Parity Protection: N

- PCIe iATU
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

