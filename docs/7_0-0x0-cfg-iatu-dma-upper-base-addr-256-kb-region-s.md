# 7 :0 0x0 CFG_IATU_DMA_UPPER_BASE_ADDR: 256 KB region starting at this address would be directed to iATU/DMA regions of the Device. Refer : ARPCIE_IATU_DMA documentation for offsets

- PCIE_RP_APPL_CONFIG_REGION_BASE_ADDR_0
BASE_ADDR is required to perform address decodes to identify whether an outbound request is targeting PCIE configuration address space.
- Offset: 0x150
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

