# 19 :16 0x1 PTM_CAP_VERSION:

- Precision Time Measurement PCI Express Extended Capability Version. This
field is a PCI-SIG defined version number that indicates the version of the
- Capability structure present. This bit depends on the version of the
specification. Note: The access attributes of this field are as follows: - Wire:
- No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 15:0 0x1f PTM_CAP_ID:
- Precision Time Measurement PCI Express Extended Capability ID. This field is
a PCI-SIG defined ID number that indicates the nature and format of the
- Extended Capability. PCI Express Extended Capability ID for the Precision
- Time Measurement Capability is 001Fh. Note: The access attributes of this
field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PTM_CAP_PTM_CAP_OFF_0
where <i> = 1, 4, 8. Description: This register describes a Function's support for Precision Time Measurement. Not all fields within this register apply to all Functions capable of implementing PTM.
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_PTM_CAP_PTM_CAP_OFF_0
- Offset: 0x2e8
- Reset: 0x00001006 (0b0000,0000,0000,0000,0001,0000,0000,0110)
- Bit
R/W
- Reset
- Description

