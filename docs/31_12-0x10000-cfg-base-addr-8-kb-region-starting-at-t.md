# 31 :12 0x10000 CFG_BASE_ADDR: 8 KB region starting at this Address is allocated. Lower 4KB to access PCIE configuration Space of the device and upper 4KB for Shadow registers.

- PCIE_RP_APPL_CFG_IATU_DMA_BASE_ADDR_0
BASE_ADDR is required to perform address decodes to identify whether an outbound request is targeting external devices or the controller's configuration register space, including the shadow registers.
- Offset: 0x108
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,00xx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

