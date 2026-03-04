# 31 :24 0x0 CORR_COUNTER_SELECTED:

- Counter selection. Returns the value set in the
- CORR_COUNTER_SELECTION field of the
RASDP_CORR_COUNTER_CTRL_OFF register. 23:20 0x0 CORR_COUNTER_SELECTED_REGION:
- Selected correctable counter region. All encodings other than the
defined encodings are reserved. 19:8 0x0 RSVDP_8: Reserved for future use. 7:0 0x0 CORR_COUNTER: Current corrected error count for the selected counter.
- PCIE_X<j>_EP_PF0_VSECRAS_CAP_RASDP_UNCORR_COUNTER_CTRL_OFF_0
where <j> = 4, 8.
- Description:This is a viewport control register. Setting the
- UNCORR_COUNTER_SELECTION_REGION and UNCORR_COUNTER_SELECTION fields in this
register determine the counter data returned by the RASDP_UNCORR_COUNT_REPORT_OFF viewport data register.
- PCIE_X4_EP_PF0_VSECRAS_CAP_RASDP_UNCORR_COUNTER_CTRL_OFF_0
- Offset: 0x2d0

- PCIe x4/x8 Endpoint
- PCIE_X8_EP_PF0_VSECRAS_CAP_RASDP_UNCORR_COUNTER_CTRL_OFF_0
- Offset: 0x2e4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000010 (0b0000,0000,0000,0000,0000,0000,0001,0000)
- Bit
R/W
- Reset
- Description

