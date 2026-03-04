# 31 :20 0x314 DLINK_NEXT_OFFSET:

- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h, if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space, this
offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. The bottom 2 bits of this offset are Reserved and must be implemented as 00b although software must mask them to allow for future uses of these bits. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 DLINK_CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. This field depends on the version of the specification. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0x25 DLINK_EXT_CAP_ID:
- Capability ID. This field is a PCI-SIG defined ID number that indicates the nature
and format of the Extended Capability. Extended Capability ID for Data Link Feature is 0025h. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_DLINK_CAP_DATA_LINK_FEATURE_CAP_OFF_0
where <j> = 4, 8. Description:This register provides description about extended feature.
- PCIE_X4_EP_PF0_DLINK_CAP_DATA_LINK_FEATURE_CAP_OFF_0
- Offset: 0x2f8
- PCIE_X8_EP_PF0_DLINK_CAP_DATA_LINK_FEATURE_CAP_OFF_0
- Offset: 0x30c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x80000001 (0b1000,0000,0000,0000,0000,0000,0000,0001)

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description
- RW
0x1 DL_FEATURE_EXCHANGE_EN:
- Data Link Feature Exchange Enable. If Set, this bit indicates that
this Port will enter the DL_Feature negotiation state. Note: The access attributes of this field are as follows: - Wire: HWINIT - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) 30:23
- RO
0x0 RSVDP_23: Reserved for future use. 22:1
- RW
0x0 FUTURE_FEATURE_SUPPORTED:
- Local Future Data Link Feature Supported. Note: The access
attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- RW
0x1 SCALED_FLOW_CNTL_SUPPORTED:
- Local Scaled Flow Control Supported. - Bit 0: Local Scaled Flow
- Control Supported - Bits [22:1]: RsvdP Bits associated with features
that this Port is capable of supporting are HwInit, defaulting to 1b. Note: The access attributes of this field are as follows: - Wire:
- HWINIT - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else
R(sticky)
- PCIE_X<j>_EP_PF0_DLINK_CAP_DATA_LINK_FEATURE_STATUS_OFF_0
where <j> = 4, 8. Description:This register provides status of the capability of data link feature.
- PCIE_X4_EP_PF0_DLINK_CAP_DATA_LINK_FEATURE_STATUS_OFF_0
- Offset: 0x2fc
- PCIE_X8_EP_PF0_DLINK_CAP_DATA_LINK_FEATURE_STATUS_OFF_0
- Offset: 0x310
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 DATA_LINK_FEATURE_STATUS_VALID:
- Remote Data Link Feature Supported Valid. This field indicates that the Port
has received a Data Link Feature DLLP in state DL_Feature and that the
- Remote Data Link Feature Supported and Remote Data Link Feature Ack
fields are meaningful. This field is Cleared on entry to state DL_Inactive.

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description

