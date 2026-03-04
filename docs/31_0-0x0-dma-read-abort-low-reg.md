# 31 :0 0x0 DMA_READ_ABORT_LOW_REG:

- The DMA uses this field to generate bits [31:0] of the address field for the
- Abort IMWr TLP. Bits [1:0] must be '00' as this address must be dword
aligned. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W
- PCIE_DMA_CAP_PF0_DMA_CAP_DMA_READ_ABORT_IMWR_HIGH_OFF_0
Description: This register holds the higher 32 bits of the Abort IMWr TLP address.
- Offset: 0x200d8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- PCIe iATU
- Bit
- Reset
- Description

