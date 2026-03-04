# 31 :30 0x0 RSVDP_30: Reserved for future use. 29:26 0xd MASTER_PAGE_BOUNDARY_POINTER_WIDTH:

- This field provides address page boundary information. It reports the
value of CC_MSTR_PAGE_BOUNDARY_PW configuration parameter. 25:23 0x0 MASTER_BURST_LENGTH: Reports the CC_MSTR_BURST_LEN configuration parameter. 22:20 0x3 MASTER_BUS_WIDTH:
- This field provides information regarding the AXI master data bus
width. It reports the value of MASTER_BUS_DATA_WIDTH configuration parameter. 0x1 AXI:
- This field provides information about AXI interface usage. It reports the
value of AXI_POPULATED configuration parameter. 18:16 0x0 CHANNEL_SEPARATION:
- If the MAP_FORMAT is set to HDMA_NATIVE, this field specifies the
read write channel address separation. Other values are reserved. 15:11 0x0 PFN:
- Physical Function Number. This field provides information regarding the
DMA register and physical function mapping. 10:8 0x4 BARN:
- Bar Number. This field provides information regarding the DMA register
and BAR number mapping. 7:3 0x0 RSVDP_3: Reserved for future use.

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description

