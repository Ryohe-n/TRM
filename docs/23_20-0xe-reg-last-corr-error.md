# 23 :20 0xe REG_LAST_CORR_ERROR:

- Region of the last corrected error. All encodings other than the defined
encodings are reserved. 19:16 0x0 RSVDP_16: Reserved for future use. 15:8 0x0 LOC_FIRST_CORR_ERROR:
- Location/ID of the first corrected error within the region defined by
- REG_FIRST_CORR_ERROR. You can cycle this field value from 0 to 255 to
access all counters. 7:4 0xe REG_FIRST_CORR_ERROR:
- Region of the first corrected error. All encodings other than the defined
encodings are reserved. 3:0 0x0 RSVDP_0: Reserved for future use.
- PCIE_X<j>_EP_PF0_VSECRAS_CAP_RASDP_UNCORR_ERROR_LOCATION_OFF_0
where <j> = 4, 8. Description:Uncorrected errors locations. For more details, see the RAS Data Protection (DP) section in the Core Operations chapter of the Databook.
- PCIE_X4_EP_PF0_VSECRAS_CAP_RASDP_UNCORR_ERROR_LOCATION_OFF_0
- Offset: 0x2e0
- PCIE_X8_EP_PF0_VSECRAS_CAP_RASDP_UNCORR_ERROR_LOCATION_OFF_0
- Offset: 0x2f4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00e000e0 (0b0000,0000,1110,0000,0000,0000,1110,0000)
- Bit
- Reset
- Description

