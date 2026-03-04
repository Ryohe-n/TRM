# 31 :20 0x2f0 PTM_NEXT_OFFSET: Precision Time Measurement PCI Express Extended Capability Next Offset.

- This field contains the offset to the next PCI Express Extended Capability
structure or 000h if no other items exist in the linked list of Capabilities.
- Note: The access attributes of this field are as follows: - Wire: No access. -
- Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This
register field is sticky. 19:16 0x1 PTM_CAP_VERSION:
- Precision Time Measurement PCI Express Extended Capability Version. This
field is a PCI-SIG defined version number that indicates the version of the
- Capability structure present. This bit depends on the version of the
specification. Note: The access attributes of this field are as follows: - Wire:
- No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- Bit
- Reset
- Description

