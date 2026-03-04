# 31 :20 0x54 PTM_REQ_VSEC_LENGTH:

- PTM Requester VSEC Length. For more details, see the PTM section in the
- Databook. Note: The access attributes of this field are as follows: - Wire: R
(sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 PTM_REQ_VSEC_REV:
- PTM Requester VSEC Revision. For more details, see the PTM section in the
- Databook. Note: The access attributes of this field are as follows: - Wire: R
(sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0x3 PTM_REQ_VSEC_ID:
- PTM Requester VSEC ID. For more details, see the PTM section in the
- Databook. Note: The access attributes of this field are as follows: - Wire: R
(sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_PTM_REQ_CAP_PTM_REQ_CONTROL_OFF_0
where <j> = 4, 8. Description:For more details, see the PTM section in the Databook.
- PCIE_X4_EP_PF0_PTM_REQ_CAP_PTM_REQ_CONTROL_OFF_0
- Offset: 0x314
- PCIE_X8_EP_PF0_PTM_REQ_CAP_PTM_REQ_CONTROL_OFF_0
- Offset: 0x328
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000900 (0b0000,0000,0000,0000,0000,1001,0000,0000)

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description

