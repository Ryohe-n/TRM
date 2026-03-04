# 2 :0 0x2 PCI_MSIX_BIR:

- MSI-X Table BAR Indicator Register Field. This field indicates which one of a
- Function's Base Address Registers , located beginning at 10h in Configuration
- Space, or entry in the Enhanced Allocation capability with a matching BEI , is used
to map the Function's MSI-X Table into Memory Space. All encodings other than the defined encodings are reserved. For a 64-bit Base Address Register , the
- Table BIR indicates the lower DWORD. For Functions with Type 1 Configuration
- Space headers, BIR values 2 through 5 are also Reserved. Note: The access
attributes of this field are as follows: - Wire: No access - Dbi: No access - Dbi2: if (DBI_RO_WR_EN == 1 && MSIX_CAP_ENABLE=1 ) then R/W else R Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_MSIX_CAP_DBI2_SHADOW_MSIX_PBA_OFFSET_REG_0
where <j> = 4, 8. Description:This register provides PBA Offset and PBA BIR value.
- PCIE_X4_EP_PF0_MSIX_CAP_DBI2_SHADOW_MSIX_PBA_OFFSET_REG_0
- PCIE_X8_EP_PF0_MSIX_CAP_DBI2_SHADOW_MSIX_PBA_OFFSET_REG_0
- Offset: 0x10b8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00010002 (0b0000,0000,0000,0001,0000,0000,0000,0010)
- Bit
- Reset
- Description

