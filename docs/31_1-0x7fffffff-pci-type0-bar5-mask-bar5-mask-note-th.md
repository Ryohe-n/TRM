# 31 :1 0x7fffffff PCI_TYPE0_BAR5_MASK: BAR5 Mask. Note: The access attributes of this field are as follows:

- Wire: No access - Dbi: No access - Dbi2: W (sticky) Note: This
register field is sticky. 0x0 PCI_TYPE0_BAR5_ENABLED: BAR5 Mask Enabled. Note: This register field is sticky.

- PCIe x4/x8 Endpoint
- PCIE_X<j>_EP_PF0_TYPE0_HDR_DBI2_EXP_ROM_BAR_MASK_REG_0
where <j> = 4, 8. Description:This register is the mask for EXP_ROM_BASE_ADDR_REG register. If implemented, it exists as a shadow register at EXP_ROM_BAR_MASK_REG address. The assertion of CS2 (that is, assert the dbi_cs2 input, or the CS2 address bit for the AXI bridge) is required to write to this register.
- PCIE_X4_EP_PF0_TYPE0_HDR_DBI2_EXP_ROM_BAR_MASK_REG_0
- PCIE_X8_EP_PF0_TYPE0_HDR_DBI2_EXP_ROM_BAR_MASK_REG_0
- Offset: 0x1030
- Read/Write: WO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0001fffe (0b0000,0000,0000,0001,1111,1111,1111,1110)
- Bit
- Reset
- Description

