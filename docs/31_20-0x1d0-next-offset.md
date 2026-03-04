# 31 :20 0x1d0 NEXT_OFFSET:

- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h, if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space, this
offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. The bottom 2 bits of this offset are Reserved and must be implemented as 00b although software must mask them to allow for future uses of these bits. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. This field is depends on version of the specification. Note: The access attributes of this field are as follows: -
- Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 15:0 0x1e EXTENDED_CAP_ID:
- L1SUB Extended Capability ID. This field is a PCI-SIG defined ID number that
indicates the nature and format of the Extended Capability. Extended Capability
- ID for L1 PM Substates is 001Eh. Note: The access attributes of this field are as
follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_L1SUB_CAP_L1SUB_CAPABILITY_REG_0
where <j> = 4, 8. Description:This register provides extended capability of L1 Substates.
- PCIE_X4_EP_PF0_L1SUB_CAP_L1SUB_CAPABILITY_REG_0
- Offset: 0x1b0
- PCIE_X8_EP_PF0_L1SUB_CAP_L1SUB_CAPABILITY_REG_0
- Offset: 0x1c4

- PCIe x4/x8 Endpoint
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00a03c1f (0b0000,0000,1010,0000,0011,1100,0001,1111)
- Bit
R/W
- Reset
- Description

