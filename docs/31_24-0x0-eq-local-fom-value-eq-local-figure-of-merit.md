# 31 :24 0x0 EQ_LOCAL_FOM_VALUE: EQ Local Figure of Merit. Indicates Local maximum Figure of Merit value. Note: This register field is sticky. 23:21 0x0 RSVDP_21: Reserved for future use. 20:18 0x0 EQ_LOCAL_RX_HINT:

- EQ Local Receiver Preset Hint. Indicates Local Receiver Preset Hint value. If
select rate in the EQ_RATE_SEL field is other than 8.0GT/s Speed, this feature is not available. Note: This register field is sticky. 17:12 0x0 EQ_LOCAL_POST_CURSOR: EQ Local Post-Cursor. Indicates Local post cursor coefficient value. Note: This register field is sticky. 11:6 0x0 EQ_LOCAL_CURSOR:
- EQ Local Cursor. Indicates Local cursor coefficient value. Note: This
register field is sticky. 5:0 0x0 EQ_LOCAL_PRE_CURSOR: EQ Local Pre-Cursor. Indicates Local pre cursor coefficient value. Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_RAS_DES_CAP_SD_EQ_STATUS3_REG_0
where <j> = 4, 8. Description:This viewport register returns the third of three words of Silicon Debug EQ Status data for the rate and lane selected by the EQ_RATE_SEL and EQ_LANE_SEL fields in the
- SD_EQ_CONTROL1_REG register. Each field is available when Equalization finished
successfully(EQ_CONVERGENCE_INFO=1). For more details, see the RAS DES section in the Core Operations chapter of the Databook.
- PCIE_X4_EP_PF0_RAS_DES_CAP_SD_EQ_STATUS3_REG_0
- Offset: 0x2a4
- PCIE_X8_EP_PF0_RAS_DES_CAP_SD_EQ_STATUS3_REG_0
- Offset: 0x2b8

- PCIe x4/x8 Endpoint
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

