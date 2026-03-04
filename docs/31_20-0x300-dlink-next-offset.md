# 31 :20 0x300 DLINK_NEXT_OFFSET:

- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h, if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space, this
offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. The bottom 2 bits of this offset are Reserved and must be implemented as 00b although software must mask them to allow for future uses of these bits. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 DLINK_CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. This field depends on the version of the specification. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0x25 DLINK_EXT_CAP_ID:
- Capability ID. This field is a PCI-SIG defined ID number that indicates the nature
and format of the Extended Capability. Extended Capability ID for Data Link Feature is 0025h. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X8_EP_PF0_DLINK_CAP_DATA_LINK_FEATURE_EXT_HDR_OFF_0

- PCIe x4/x8 Endpoint
- Offset: 0x308
- Reset: 0x31410025 (0b0011,0001,0100,0001,0000,0000,0010,0101)
- Bit
- Reset
- Description

