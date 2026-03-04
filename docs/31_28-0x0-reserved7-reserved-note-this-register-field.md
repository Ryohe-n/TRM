# 31 :28 0x0 RESERVED7: Reserved. Note: This register field is sticky. 27:26 0x1 VC0_NP_DATA_SCALE: VC0 Scale Non-Posted Data Credits. Note: This register field is sticky. 25:24 0x2 VC0_NP_HDR_SCALE: VC0 Scale Non-Posted Header Credits. Note: This register field is sticky. 23:21 0x1 VC0_NP_TLP_Q_MODE: Reserved. Note: This register field is sticky. 0x0 RESERVED6: Reserved. Note: This register field is sticky. 19:12 0x2c VC0_NP_HEADER_CREDIT:

- VC0 Non-Posted Header Credits. The number of initial non-posted header
credits for VC0, used only in the segmented-buffer configuration. Note:
- The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: R
(sticky) Note: This register field is sticky. 11:0 0x2c VC0_NP_DATA_CREDIT:
- VC0 Non-Posted Data Credits. The number of initial non-posted data
credits for VC0, used only in the segmented-buffer configuration. Note:
- The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: R
(sticky) Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_PORT_LOGIC_VC0_CPL_RX_Q_CTRL_OFF_0
where <j> = 4, 8. Description:This register controls the segmented-buffer VC0 completion receive queue operation.

- PCIe x4/x8 Endpoint
- PCIE_X4_EP_PF0_PORT_LOGIC_VC0_CPL_RX_Q_CTRL_OFF_0
- PCIE_X8_EP_PF0_PORT_LOGIC_VC0_CPL_RX_Q_CTRL_OFF_0
- Offset: 0x750
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x06200000 (0b0000,0110,0010,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

