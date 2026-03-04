# 31 :3 0x0 PCI_MSIX_TABLE_OFFSET:

- MSI-X Table Offset. Used as an offset from the address contained by one of the
- Function's Base Address Registers to point to the base of the MSI-X Table. The
lower 3 Table BIR bits are masked off (set to zero) by software to form a 32-bit
- QWORD-aligned offset. Note: The access attributes of this field are as follows: -
- Wire: No access - Dbi: No access - Dbi2: if (DBI_RO_WR_EN == 1 &&
MSIX_CAP_ENABLE=1 ) then R/W else R Note: This register field is sticky.

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description

