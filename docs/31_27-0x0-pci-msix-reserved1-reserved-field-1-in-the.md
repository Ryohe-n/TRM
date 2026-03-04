# 31 :27 0x0 PCI_MSIX_RESERVED1: reserved field 1 in the shadow register. Note: This register field is sticky. 26:16 0x7 PCI_MSIX_TABLE_SIZE:

- MSI-X Table Size in the shadow register. Note: The access attributes of
this field are as follows: - Wire: No access - Dbi: No access - Dbi2: if (DBI_RO_WR_EN == 1) then R/W else R Note: This register field is sticky. 15:0 0x0 PCI_MSIX_RESERVED0: reserved field 0 in the shadow register. Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_MSIX_CAP_DBI2_SHADOW_MSIX_TABLE_OFFSET_REG_0
where <j> = 4, 8. Description:This register provides Table BIR and MSI-x Table offset select.
- PCIE_X4_EP_PF0_MSIX_CAP_DBI2_SHADOW_MSIX_TABLE_OFFSET_REG_0
- PCIE_X8_EP_PF0_MSIX_CAP_DBI2_SHADOW_MSIX_TABLE_OFFSET_REG_0
- Offset: 0x10b4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000002 (0b0000,0000,0000,0000,0000,0000,0000,0010)
- Bit
- Reset
- Description

