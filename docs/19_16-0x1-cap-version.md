# 19 :16 0x1 CAP_VERSION:

- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. Value of this field is depends on the version of the specification. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0xb EXTENDED_CAP_ID:
- PCI Express Extended Capability ID. This field is a PCI-SIG defined ID number
that indicates the nature and format of the Extended Capability. Extended
- Capability ID for the Vendor-Specific Extended Capability is 000Bh. Note: The
access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_RAS_DES_CAP_VENDOR_SPECIFIC_HEADER_REG_0
where <i> = 1, 4, 8. Description: This Register field provides VSEC Length, VSEC ID and VSEC Rev(Version Number). Vendor-specific software must qualify the associated Vendor ID of the PCI Express Function or RCRB before attempting to interpret the values in the VSEC ID or VSEC Rev fields.
- PCIE_X1_RC_PF0_RAS_DES_CAP_VENDOR_SPECIFIC_HEADER_REG_0
- Offset: 0x1a4
- PCIE_X4_RC_PF0_RAS_DES_CAP_VENDOR_SPECIFIC_HEADER_REG_0
- Offset: 0x1c0
- PCIE_X8_RC_PF0_RAS_DES_CAP_VENDOR_SPECIFIC_HEADER_REG_0
- Offset: 0x1d4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x10040002 (0b0001,0000,0000,0100,0000,0000,0000,0010)
- Bit
- Reset
- Description

