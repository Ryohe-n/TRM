# 31 :20 0x388 PTM_REQ_EXT_CAP_NEXT_OFFS:

- Precision Time Measurement Requester VSEC Next Pointer. For more
details, see the PTM section in the Databook. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 PTM_REQ_EXT_CAP_VER:
- Precision Time Measurement Requester VSEC Version. For more details, see
the PTM section in the Databook. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0xb PTM_REQ_EXT_CAP_ID:
- Precision Time Measurement Requester VSEC ID. For more details, see the
- PTM section in the Databook. Note: The access attributes of this field are
as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_PTM_REQ_CAP_PTM_REQ_HDR_OFF_0
where <j> = 4, 8. Description:For more details, see the PTM section in the Databook.
- PCIE_X4_EP_PF0_PTM_REQ_CAP_PTM_REQ_HDR_OFF_0
- Offset: 0x310

- PCIe x4/x8 Endpoint
- PCIE_X8_EP_PF0_PTM_REQ_CAP_PTM_REQ_HDR_OFF_0
- Offset: 0x324
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x05410003 (0b0000,0101,0100,0001,0000,0000,0000,0011)
- Bit
- Reset
- Description

