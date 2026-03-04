# 31 :0 0x0 PCI_MSI_CAP_OFF_14H:

- Pending Bits. For each pending bit that is set, the function has a
pending associated message.
- PCIE_X<j>_EP_PF0_PCIE_CAP_PCIE_CAP_ID_PCIE_NEXT_CAP_PTR_PCIE_CAP_REG_0
where <j> = 4, 8. Description:This is the PCI Express Capabilities, ID, and Next Pointer Register.
- PCIE_X4_EP_PF0_PCIE_CAP_PCIE_CAP_ID_PCIE_NEXT_CAP_PTR_PCIE_CAP_REG_0
- PCIE_X8_EP_PF0_PCIE_CAP_PCIE_CAP_ID_PCIE_NEXT_CAP_PTR_PCIE_CAP_REG_0

- PCIe x4/x8 Endpoint
- Offset: 0x70
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0002b010 (0b0000,0000,0000,0010,1011,0000,0001,0000)
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_31: Reserved for future use.
- RO
0x0 RSVD: Reserved. 29:25
- RW
0x0 PCIE_INT_MSG_NUM:
- PCIE Interrupt Message Number. Interrupt Message Number. This field
indicates which MSI/MSI-X vector is used for the interrupt message generated in association with any of the status bits of this Capability structure. For MSI, the value in this field indicates the offset between the base Message Data and the interrupt message that is generated.
- Hardware is required to update this field so that it is correct if the number
of MSI Messages assigned to the Function changes when software writes to the Multiple Message Enable field in the MSI Message Control register.
- For MSI-X, the value in this field indicates which MSI-X Table entry is used
to generate the interrupt message. The entry must be one of the first 32 entries even if the Function implements more than 32 entries. For a given
- MSI-X implementation, the entry must remain constant. If both MSI and
- MSI-X are implemented, they are permitted to use different vectors,
though software is permitted to enable only one mechanism at a time. If MSI-X is enabled, the value in this field must indicate the vector for MSI-X.
- If MSI is enabled or neither is enabled, the value in this field must indicate
the vector for MSI. If software enables both MSI and MSI-X at the same time, the value in this field is undefined. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky.
- RW
0x0 PCIE_SLOT_IMP:
- Slot Implemented. When set, this bit indicates that the Link associated
with this Port is connected to a slot (as compared to being connected to a system-integrated device or being disabled). This bit is valid for
- Downstream Ports. This bit is undefined for Upstream Ports. Note: The
access attributes of this field are as follows: - Wire: HWINIT - Dbi: if (DBI_RO_WR_EN == 1) then R/W else R 23:20
- RO
0x0 PCIE_DEV_PORT_TYPE: Device/Port Type. Indicates the specific type of this PCI Express function.
- Note: Different functions in a Multi-Function Device can generally be of
different types. Defined encodings for functions that implement a Type 00h PCI Configuration Space header are: Defined encodings for functions that implement a Type 01h PCI Configuration Space header are: All other encodings are Reserved. Note: Different Endpoint types have notably different requirements in Section 1.3.2 of PCI Express Base Specification regarding I/O resources, Extended Configuration Space, and other capabilities.

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description

