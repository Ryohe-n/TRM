# 31 :20 0x2e4 DLINK_NEXT_OFFSET:

- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h, if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space, this
offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. The bottom 2 bits of this offset are Reserved and must be implemented as 00b although software must mask them to allow for future uses of these bits. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 DLINK_CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. This field depends on the version of the specification. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0x25 DLINK_EXT_CAP_ID:
- Capability ID. This field is a PCI-SIG defined ID number that indicates the nature
and format of the Extended Capability. Extended Capability ID for Data Link Feature is 0025h. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_CAP_OFF_0
where <i> = 1, 4, 8. Description: This register provides description about extended feature.
- PCIE_X1_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_CAP_OFF_0
- Offset: 0x2dc
- PCIE_X4_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_CAP_OFF_0
- Offset: 0x2f8
- PCIE_X8_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_CAP_OFF_0
- Offset: 0x30c

- PCIe x1/x4/x8 Root Complex
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x80000001 (0b1000,0000,0000,0000,0000,0000,0000,0001)
- Bit
R/W
- Reset
- Description
- RW
0x1 DL_FEATURE_EXCHANGE_EN:
- Data Link Feature Exchange Enable. If Set, this bit indicates that
this Port will enter the DL_Feature negotiation state. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) 30:23
- RO
0x0 RSVDP_23: Reserved for future use. 22:1
- RW
0x0 FUTURE_FEATURE_SUPPORTED:
- Local Future Data Link Feature Supported. Note: The access
attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- RW
0x1 SCALED_FLOW_CNTL_SUPPORTED:
- Local Scaled Flow Control Supported. - Bit 0: Local Scaled Flow
- Control Supported - Bits [22:1]: RsvdP Bits associated with features
that this Port is capable of supporting are HwInit, defaulting to 1b.
- Note: The access attributes of this field are as follows: - Wire: No
access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
- PCIE_X<i>_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_STATUS_OFF_0
where <i> = 1, 4, 8. Description: This register provides status of the capability of data link feature.
- PCIE_X1_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_STATUS_OFF_0
- Offset: 0x2e0
- PCIE_X4_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_STATUS_OFF_0
- Offset: 0x2fc
- PCIE_X8_RC_PF0_DLINK_CAP_DATA_LINK_FEATURE_STATUS_OFF_0
- Offset: 0x310
- Read/Write: RO
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 DATA_LINK_FEATURE_STATUS_VALID:
- Remote Data Link Feature Supported Valid. This field indicates that the Port
has received a Data Link Feature DLLP in state DL_Feature and that the
- Remote Data Link Feature Supported and Remote Data Link Feature Ack
fields are meaningful. This field is Cleared on entry to state DL_Inactive. 30:23 0x0 RSVDP_23: Reserved for future use. 22:0 0x0 REMOTE_DATA_LINK_FEATURE_SUPPORTED:
- Remote Data Link Feature Supported. - Bit 0: Remote Scaled Flow Control
- Supported - Bits [22:1]: Undefined
- PCIE_X<i>_RC_PF0_PTM_CAP_PTM_EXT_CAP_HDR_OFF_0
where <i> = 1, 4, 8. Description: This Register provides Capability ID, Cabability Version, and Next Offset of Precision Time Measurement Capability structure.
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_PTM_CAP_PTM_EXT_CAP_HDR_OFF_0
- Offset: 0x2e4
- Reset: 0x2f01001f (0b0010,1111,0000,0001,0000,0000,0001,1111)
- Bit
- Reset
- Description

