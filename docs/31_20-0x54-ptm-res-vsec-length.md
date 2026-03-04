# 31 :20 0x54 PTM_RES_VSEC_LENGTH:

- PTM Responder VSEC Length. For more details, see the PTM section in the
- Databook. Note: The access attributes of this field are as follows: - Wire: No
access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 PTM_RES_VSEC_REV:
- PTM Responder VSEC Revision. For more details, see the PTM section in
the Databook. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else
R(sticky) Note: This register field is sticky. 15:0 0x4 PTM_RES_VSEC_ID:
- PTM Responder VSEC ID. For more details, see the PTM section in the
- Databook. Note: The access attributes of this field are as follows: - Wire: No
access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_CONTROL_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_CONTROL_OFF_0
- Offset: 0x2f8
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_CONTROL_OFF_0
- Offset: 0x314
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_CONTROL_OFF_0
- Offset: 0x328

- PCIe x1/x4/x8 Root Complex
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

