# 31 :0 0x0 PCI_MSI_CAP_OFF_10H:

- Used for MSI when the Per Vector Masking Capable bit
(PCI_MSI_CAP_ID_NEXT_CTRL_REG.PCI_PVM_SUPPORT) is set. For 32-bit contains Pending Bits. For 64-bit, contains Mask Bits. Note: The access attributes of this field are as follows: - Wire: PCI_MSI_64_BIT_ADDR_CAP &&
- MSI_PVM_EN ? R/W : R - Dbi: PCI_MSI_64_BIT_ADDR_CAP && MSI_PVM_EN ?
R/W : R
- PCIE_X<j>_EP_PF0_MSI_CAP_MSI_CAP_OFF_14H_REG_0
where <j> = 4, 8. Description:Pending Bits Register for MSI. This register is used for a function that supports a 64- bit message address when the Per-Vector Masking Capable bit (bit 24 of PCI_MSI_CAP_ID_NEXT_CTRL_REG) is set.
- PCIE_X4_EP_PF0_MSI_CAP_MSI_CAP_OFF_14H_REG_0
- PCIE_X8_EP_PF0_MSI_CAP_MSI_CAP_OFF_14H_REG_0
- Offset: 0x64
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

