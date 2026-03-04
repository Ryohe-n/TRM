# 31 :20 0x1ac NEXT_OFFSET:

- Next Capability Offset. This field contains the offset to the next PCI Express
- Extended Capability structure or 000h if no other items exist in the linked
list of Capabilities. Note: The access attributes of this field are as follows: -
- Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that
indicates the version of the Capability structure present. This field is depends on version of the specification. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0x18 CAP_ID:
- LTR Extended Capacity ID. This field is a PCI-SIG defined ID number that
indicates the nature and format of the Extended Capability. PCI Express
- Extended Capability for the LTR Extended Capability is 0018h. Note: The
access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X8_EP_PF0_LTR_CAP_LTR_CAP_HDR_REG_0
- Offset: 0x1b8
- Reset: 0x1c010018 (0b0001,1100,0000,0001,0000,0000,0001,1000)
- Bit
- Reset
- Description

