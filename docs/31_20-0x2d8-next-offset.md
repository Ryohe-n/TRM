# 31 :20 0x2d8 NEXT_OFFSET:

- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space, this
offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. The bottom 2 bits of this offset are Reserved and must be implemented as 00b although software must mask them to allow for future uses of these bits. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 CAP:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. A version of the specification that changes the Extended Capability in a way that is not otherwise identifiable (e.g., through a new Capability field) is permitted to increment this field. All such changes to the Capability structure must be software-compatible. Software must check for Capability Version numbers that are greater than or equal to the highest number defined when the software is written, as Functions reporting any such Capability Version numbers will contain a Capability structure that is compatible with that piece of software. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0xb ID:
- PCI Express Extended Capability ID. This field is a PCI-SIG defined ID number
that indicates the nature and format of the Extended Capability. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X4_RC_PF0_VSECRAS_CAP_RASDP_EXT_CAP_HDR_OFF_0
- Offset: 0x2bc
- Reset: 0x2f41000b (0b0010,1111,0100,0001,0000,0000,0000,1011)
- Bit
- Reset
- Description

