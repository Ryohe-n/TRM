# 31 :20 0x388 PTM_RES_EXT_CAP_NEXT_OFFS:

- Precision Time Measurement Responder VSEC Next Pointer. For more
details, see the PTM section in the Databook. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 PTM_RES_EXT_CAP_VER:
- Precision Time Measurement Responder VSEC Version. For more details, see
the PTM section in the Databook. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0xb PTM_RES_EXT_CAP_ID:
- Precision Time Measurement Responder VSEC ID. For more details, see the
- PTM section in the Databook. Note: The access attributes of this field are
as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_RES_CAP_PTM_RES_HDR_OFF_0
where <i> = 1, 4, 8. Description: For more details, see the PTM section in the Databook.
- PCIE_X1_RC_PF0_PTM_RES_CAP_PTM_RES_HDR_OFF_0
- Offset: 0x2f4

- PCIe x1/x4/x8 Root Complex
- PCIE_X4_RC_PF0_PTM_RES_CAP_PTM_RES_HDR_OFF_0
- Offset: 0x310
- PCIE_X8_RC_PF0_PTM_RES_CAP_PTM_RES_HDR_OFF_0
- Offset: 0x324
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x05410004 (0b0000,0101,0100,0001,0000,0000,0000,0100)
- Bit
- Reset
- Description

