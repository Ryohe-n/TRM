# 31 :1 0x7fffffff PCI_TYPE0_BAR3_MASK: BAR3 Mask. Note: The access attributes of this field are as follows:

- Wire: No access - Dbi: No access - Dbi2: W (sticky) Note: This
register field is sticky. 0x0 PCI_TYPE0_BAR3_ENABLED: BAR3 Mask Enabled. Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_TYPE0_HDR_DBI2_BAR4_MASK_REG_0
where <j> = 4, 8. Description:This register is the mask for BAR4_REG. If implemented, it exists as a shadow register at the BAR4_REG address. Normally, the BAR masks are used for indicating the amount of address space that each BAR requests from host software. The BAR masks determine which bits in each BAR are non-writable by host software, which determines the size of the address space claimed by each BAR. The BAR mask values indicate the range of low-order bits, in each implemented BAR, not to use for address matching. The BAR mask value also indicates the range of low-order bits in the BAR that cannot be written from the host. The application can write to all BAR bits to allow setting of memory, I/O, and other standard BAR options. Your local CPU can change the mask at runtime using the DBI. The mask register is invisible to the PCIe wire but visible to your local CPU through the DBI. You cannot read the mask register but you can write to it. It is accessed by asserting dbi_cs2 and dbi_cs. If you only assert dbi_cs then you will access the BAR which is the primary register at that location. Use CS2 instead of dbi_cs2 when you are using the AHB/AXI bridge.
- PCIE_X4_EP_PF0_TYPE0_HDR_DBI2_BAR4_MASK_REG_0
- PCIE_X8_EP_PF0_TYPE0_HDR_DBI2_BAR4_MASK_REG_0
- Offset: 0x1020
- Read/Write: WO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xffffffff (0b1111,1111,1111,1111,1111,1111,1111,1111)

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description

