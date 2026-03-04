# 31 :20 0x1b8 NEXT_OFFSET:

- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space,
this offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greaterthan 0FFh. Note: The access attributes of this field are as follows: -
- Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. This field is depends on version of the specification. Note: The access attributes of this field are as follows: -
- Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 15:0 0x27 EXTENDED_CAP_ID:
- PCI Express Extended Capability ID. This field is a PCI-SIG defined ID number
that indicates the nature and format of the Extended Capability. The Extended
- Capability ID for the Physical Layer 16.0 GT/s Margining Extended Capability is
0027h. Note: The access attributes of this field are as follows: - Wire: R (sticky)
- Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This
register field is sticky.

- PCIe x4/x8 Endpoint
- PCIE_X<j>_EP_PF0_MARGIN_CAP_MARGIN_PORT_CAPABILITIES_STATUS_REG_0
where <j> = 4, 8. Description:This register indicates the status of the Margining feature.
- PCIE_X4_EP_PF0_MARGIN_CAP_MARGIN_PORT_CAPABILITIES_STATUS_REG_0
- Offset: 0x190
- PCIE_X8_EP_PF0_MARGIN_CAP_MARGIN_PORT_CAPABILITIES_STATUS_REG_0
- Offset: 0x194
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000001 (0b0000,0000,0000,0000,0000,0000,0000,0001)
- Bit
R/W
- Reset
- Description

