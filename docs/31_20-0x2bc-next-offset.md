# 31 :20 0x2bc NEXT_OFFSET:

- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space,
this offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. Note: The access attributes of this field are as follows: -
- Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. Value of this field is depends on the version of the specification. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0xb EXTENDED_CAP_ID:
- PCI Express Extended Capability ID. This field is a PCI-SIG defined ID number
that indicates the nature and format of the Extended Capability. Extended
- Capability ID for the Vendor-Specific Extended Capability is 000Bh. Note: The
access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X8_EP_PF0_RAS_DES_CAP_RAS_DES_CAP_HEADER_REG_0
- Offset: 0x1d0
- Reset: 0x2d01000b (0b0010,1101,0000,0001,0000,0000,0000,1011)

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description

