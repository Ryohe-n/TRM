# 31 :24 0x0 UNCORR_COUNTER_SELECTED:

- Counter selection. Returns the value set in the
- UNCORR_COUNTER_SELECTION field of the
RASDP_UNCORR_COUNTER_CTRL_OFF register. 23:20 0x0 UNCORR_COUNTER_SELECTED_REGION:
- Selected uncorrectable counter region. All encodings other than the
defined encodings are reserved. 19:8 0x0 RSVDP_8: Reserved for future use. 7:0 0x0 UNCORR_COUNTER:
- Current uncorrected error count for the selected counter
- PCIE_X<j>_EP_PF0_VSECRAS_CAP_RASDP_ERROR_INJ_CTRL_OFF_0
where <j> = 4, 8. Description:Error injection control for the following features: - 1-bit or 2-bit injection - Continuous or fixed-number (n) injection modes - Global enable/disable - Selectable location where injection occurs.
- PCIE_X4_EP_PF0_VSECRAS_CAP_RASDP_ERROR_INJ_CTRL_OFF_0
- Offset: 0x2d8
- PCIE_X8_EP_PF0_VSECRAS_CAP_RASDP_ERROR_INJ_CTRL_OFF_0
- Offset: 0x2ec
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

