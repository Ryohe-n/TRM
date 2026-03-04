# 31 :20 0x168 NEXT_OFFSET:

- Next Capability Offset. This field contains the offset to the next PCI Express
- Extended Capability structure or 000h if no other items exist in the linked list
of Capabilities. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that
indicates the version of the Capability structure present. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0x19 EXTENDED_CAP_ID:
- Secondary PCI Express Extended Capability ID. This field is a PCI-SIG defined
ID number that indicates the nature and format of the Extended Capability.
- PCI Express Extended Capability ID for the Secondary PCI Express Extended
- Capability is 0019h. Note: The access attributes of this field are as follows: -
- Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_SPCIE_CAP_LINK_CONTROL3_REG_0
where <j> = 4, 8. Description:This Register controls equilization and equilization interrupt.
- PCIE_X4_EP_PF0_SPCIE_CAP_LINK_CONTROL3_REG_0
- PCIE_X8_EP_PF0_SPCIE_CAP_LINK_CONTROL3_REG_0
- Offset: 0x14c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description

