# 31 :20 0x30c PTM_NEXT_OFFSET: Precision Time Measurement PCI Express Extended Capability Next Offset.

- This field contains the offset to the next PCI Express Extended Capability
structure or 000h if no other items exist in the linked list of Capabilities. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 PTM_CAP_VERSION:
- Precision Time Measurement PCI Express Extended Capability Version. This
field is a PCI-SIG defined version number that indicates the version of the
- Capability structure present. This bit depends on the version of the
specification. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0x1f PTM_CAP_ID:
- Precision Time Measurement PCI Express Extended Capability ID. This field is
a PCI-SIG defined ID number that indicates the nature and format of the
- Extended Capability. PCI Express Extended Capability ID for the Precision
- Time Measurement Capability is 001Fh. Note: The access attributes of this
field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X8_EP_PF0_PTM_CAP_PTM_EXT_CAP_HDR_OFF_0

- PCIe x4/x8 Endpoint
- Offset: 0x314
- Reset: 0x3201001f (0b0011,0010,0000,0001,0000,0000,0001,1111)
- Bit
- Reset
- Description

