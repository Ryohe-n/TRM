# 31 :3 0x0 PCI_MSIX_PBA_OFFSET:

- MSI-X PBA Offset. Used as an offset from the address contained by one of the
- Function's Base Address Registers to point to the base of the MSI-X PBA. The
lower 3 PBA BIR bits are masked off (set to zero) by software to form a 32-bit
- QWORD-aligned offset. Note: The access attributes of this field are as follows: -
- Wire: No access - Dbi: No access - Dbi2: if (DBI_RO_WR_EN == 1 &&
MSIX_CAP_ENABLE=1 ) then R/W else R Note: This register field is sticky. 2:0 0x0 PCI_MSIX_PBA_BIR:
- MSI-X PBA BIR. This field indicates which one of a Function's Base Address
- Registers , located beginning at 10h in Configuration Space, or entry in the
- Enhanced Allocation capability with a matching BEI, is used to map the
- Function's MSI-X PBA into Memory Space. The PBA BIR value definitions are
identical to those for the Table BIR . Note: The access attributes of this field are as follows: - Wire: No access - Dbi: No access - Dbi2: if (DBI_RO_WR_EN == 1 && MSIX_CAP_ENABLE=1 ) then R/W else R Note: This register field is sticky.
- PCIE_X4_RC_PF0_MSIX_CAP_DBI2_SHADOW_MSIX_PBA_OFFSET_REG_0
- PCIE_X8_RC_PF0_MSIX_CAP_DBI2_SHADOW_MSIX_PBA_OFFSET_REG_0
- Reset: 0x00010002 (0b0000,0000,0000,0001,0000,0000,0000,0010)
- Bit
- Reset
- Description

