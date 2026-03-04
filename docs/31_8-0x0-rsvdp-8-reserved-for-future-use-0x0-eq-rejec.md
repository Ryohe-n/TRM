# 31 :8 0x0 RSVDP_8: Reserved for future use. 0x0 EQ_REJECT_EVENT:

- EQ Reject Event. Indicates that the controller receives two consecutive TS1 OS
w/Reject=1b during EQ Master phase(DSP in EQ Phase3/USP in EQ Phase2).
- This bit is automatically cleared when the controller starts EQ Master phase
again. Note: This register field is sticky.

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description
0x0 EQ_RULEC_VIOLATION:
- EQ Rule C Violation. Indicates that coefficients rule C violation is detected in
the values provided by PHY using direction change method during EQ Master phase(DSP in EQ Phase3/USP in EQ Phase2). The coefficients rule C correspond to the rules c) from section "Rules for Transmitter Coefficents" in the PCI
- Express Base Specification. This bit is automatically cleared when the controller
starts EQ Master phase again. Note: This register field is sticky. 0x0 EQ_RULEB_VIOLATION:
- EQ Rule B Violation. Indicates that coefficients rule B violation is detected in
the values provided by PHY using direction change method during EQ Master phase(DSP in EQ Phase3/USP in EQ Phase2). The coefficients rules B correspond to the rules b) from section "Rules for Transmitter Coefficents" in the PCI Express Base Specification. This bit is automatically cleared when the controller starts EQ Master phase again. Note: This register field is sticky. 0x0 EQ_RULEA_VIOLATION:
- EQ Rule A Violation. Indicates that coefficients rule A violation is detected in
the values provided by PHY using direction change method during EQ Master phase(DSP in EQ Phase3/USP in EQ Phase2). The coefficients rules A correspond to the rules a) from section "Rules for Transmitter Coefficents" in the PCI Express Base Specification. This bit is automatically cleared when the controller starts EQ Master phase again. Note: This register field is sticky. 0x0 RSVDP_3: Reserved for future use. 2:1 0x0 EQ_CONVERGENCE_INFO:
- EQ Convergence Info. Indicates equalization convergence information. This bit is
automatically cleared when the controller starts EQ Master phase again. Note: This register field is sticky. 0x0 EQ_SEQUENCE:
- EQ Sequence. Indicates that the controller is starting the equalization
sequence. Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_RAS_DES_CAP_SD_EQ_STATUS2_REG_0
where <j> = 4, 8. Description:This viewport register returns the second of three words of Silicon Debug EQ Status data for the rate and lane selected by the EQ_RATE_SEL and EQ_LANE_SEL fields in the
- SD_EQ_CONTROL1_REG register. Each field is available when Equalization finished
successfully(EQ_CONVERGENCE_INFO=1). For more details, see the RAS DES section in the Core Operations chapter of the Databook.
- PCIE_X4_EP_PF0_RAS_DES_CAP_SD_EQ_STATUS2_REG_0
- Offset: 0x2a0
- PCIE_X8_EP_PF0_RAS_DES_CAP_SD_EQ_STATUS2_REG_0
- Offset: 0x2b4

- PCIe x4/x8 Endpoint
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

