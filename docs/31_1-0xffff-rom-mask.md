# 31 :1 0xffff ROM_MASK:

- Expansion ROM Mask. Note: The access attributes of this field are as
follows: - Wire: No access - Dbi: No access - Dbi2: if ROM_BAR_ENABLED && ROM_MASK_WRITABLE then W Note: This register field is sticky. 0x0 ROM_BAR_ENABLED:
- Expansion ROM Bar Mask Register Enabled. Note: The access attributes of
this field are as follows: - Wire: No access - Dbi: No access - Dbi2: if ROM_MASK_WRITABLE then W Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_MSIX_CAP_DBI2_SHADOW_PCI_MSIX_CAP_ID_NEXT_CTRL_REG_0
where <j> = 4, 8. Description:This is the shadow register of the MSI-X Capability ID, Next Pointer, and Control Register.
- PCIE_X4_EP_PF0_MSIX_CAP_DBI2_SHADOW_PCI_MSIX_CAP_ID_NEXT_CTRL_REG_0
- PCIE_X8_EP_PF0_MSIX_CAP_DBI2_SHADOW_PCI_MSIX_CAP_ID_NEXT_CTRL_REG_0
- Offset: 0x10b0
- Read/Write: RO
- Parity Protection: N

- PCIe x4/x8 Endpoint
- Shadow: N
- SCR Protection: 0
- Reset: 0x00070000 (0b0000,0000,0000,0111,0000,0000,0000,0000)
- Bit
- Reset
- Description

