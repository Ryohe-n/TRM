# 22 :20 0x1 MASTER_BUS_WIDTH:

- This field provides information regarding the AXI master data bus
width. It reports the value of MASTER_BUS_DATA_WIDTH configuration parameter. 0x1 AXI:
- This field provides information about AXI interface usage. It reports the
value of AXI_POPULATED configuration parameter. 18:16 0x0 CHANNEL_SEPARATION:
- If the MAP_FORMAT is set to HDMA_NATIVE, this field specifies the
read write channel address separation. Other values are reserved. 15:11 0x0 PFN:
- Physical Function Number. This field provides information regarding the
DMA register and physical function mapping. 10:8 0x0 BARN:
- Bar Number. This field provides information regarding the DMA register
and BAR number mapping. 7:3 0x0 RSVDP_3: Reserved for future use. 2:0 0x0 MAP_FORMAT:
- Defines the register map format and features to be one of the
following values: Other values are reserved.
- PCIE_X4_RC_PF0_VSECDMA_CAP_VSECDMA_DEVICE_INFORMATION_OFF_0
- Offset: 0x37c
- Reset: 0x34a80401 (0b0011,0100,1010,1000,0000,0100,0000,0001)
- Bit
- Reset
- Description

