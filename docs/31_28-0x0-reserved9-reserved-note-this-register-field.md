# 31 :28 0x0 RESERVED9: Reserved. Note: This register field is sticky. 27:26 0x1 VC0_CPL_DATA_SCALE: VC0 Scale CPL Data Credits. Note: This register field is sticky. 25:24 0x2 VC0_CPL_HDR_SCALE: VC0 Scale CPL Header Credits. Note: This register field is sticky. 23:21 0x1 VC0_CPL_TLP_Q_MODE: Reserved. Note: This register field is sticky. 0x0 RESERVED8: Reserved. Note: This register field is sticky. 19:12 0x0 VC0_CPL_HEADER_CREDIT:

- VC0 Completion Header Credits. The number of initial Completion header
credits for VC0, used only in the segmented-buffer configuration. Note:
- The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: R
(sticky) Note: This register field is sticky. 11:0 0x0 VC0_CPL_DATA_CREDIT:
- VC0 Completion Data Credits. The number of initial Completion data
credits for VC0, used only in the segmented-buffer configuration. Note:
- The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: R
(sticky) Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_PORT_LOGIC_GEN2_CTRL_OFF_0
where <j> = 4, 8. Description:This register controls various functions of the controller related to link training, lane reversal, and equalization.
- Offset: 0x80c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0

- PCIe x4/x8 Endpoint
- PCIE_X4_EP_PF0_PORT_LOGIC_GEN2_CTRL_OFF_0
- Reset: 0x00030434 (0b00xx,0000,0000,0011,0000,0100,0011,0100)
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_31: Reserved for future use.
- RW
0x0 FORCE_LANE_FLIP: Enable to force the LANE_UNDER_TEST physical lane flips to logical lane 0.
- All the other physical lanes are turned off. The LINK_CAPABLE register
must be set to 1 and only x1 link can be formed if the FORCE_LANE_FLIP register is set to 1. Note: The access attributes of this field are as follows:
- Wire: R (sticky) - Dbi: R/W (sticky) Note: This register field is sticky.

