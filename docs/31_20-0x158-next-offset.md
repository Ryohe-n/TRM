# 31 :20 0x158 NEXT_OFFSET:

- Next Capability Offset. This field contains the offset to the next PCI Express
- Extended Capability structure or 000h if no other items exist in the linked list
of Capabilities. Note: The access attributes of this field are as follows: - Wire:
- No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that
indicates the version of the Capability structure present. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0x19 EXTENDED_CAP_ID:
- Secondary PCI Express Extended Capability ID. This field is a PCI-SIG defined
ID number that indicates the nature and format of the Extended Capability.
- PCI Express Extended Capability ID for the Secondary PCI Express Extended
- Capability is 0019h. Note: The access attributes of this field are as follows: -
- Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else
R(sticky) Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X4_RC_PF0_SPCIE_CAP_SPCIE_CAP_HEADER_REG_0
- PCIE_X8_RC_PF0_SPCIE_CAP_SPCIE_CAP_HEADER_REG_0
- Reset: 0x16810019 (0b0001,0110,1000,0001,0000,0000,0001,1001)
- Bit
- Reset
- Description

