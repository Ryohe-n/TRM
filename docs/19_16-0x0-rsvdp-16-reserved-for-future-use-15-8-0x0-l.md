# 19 :16 0x0 RSVDP_16: Reserved for future use. 15:8 0x0 LOC_FIRST_UNCORR_ERROR:

- Location/ID of the first uncorrected error within the region defined by
- REG_FIRST_UNCORR_ERROR. You can cycle this field value from 0 to 255
to access all counters. 7:4 0xe REG_FIRST_UNCORR_ERROR:
- Region of the first uncorrected error. All encodings other than the
defined encodings are reserved. 3:0 0x0 RSVDP_0: Reserved for future use.
- PCIE_X<j>_EP_PF0_VSECRAS_CAP_RASDP_ERROR_MODE_EN_OFF_0
where <j> = 4, 8.
- Description:RASDP error mode enable. The controller enters RASDP error mode (if
ERROR_MODE_EN =1) upon detection of the first uncorrectable error. During this mode: - Rx TLPs that are forwarded to your application are not guaranteed to be correct; you must discard them. For more details, see the RAS Data Protection (DP) section in the Core Operations chapter of the Databook.
- PCIE_X4_EP_PF0_VSECRAS_CAP_RASDP_ERROR_MODE_EN_OFF_0
- Offset: 0x2e4
- PCIE_X8_EP_PF0_VSECRAS_CAP_RASDP_ERROR_MODE_EN_OFF_0
- Offset: 0x2f8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000001 (0b0000,0000,0000,0000,0000,0000,0000,0001)
- Bit
R/W
- Reset
- Description

