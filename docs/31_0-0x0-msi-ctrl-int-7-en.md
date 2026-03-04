# 31 :0 0x0 MSI_CTRL_INT_7_EN:

- MSI Interrupt7 Enable. Specifies which interrupts are enabled. When an MSI
is received from a disabled interrupt, no status bit gets set in MSI controller interrupt status register. Each bit corresponds to a single MSI Interrupt Vector. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_7_MASK_OFF_0
where <i> = 1, 4, 8. Description: This register provides information regarding the MSI Interrupt7 mask.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_7_MASK_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_7_MASK_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_7_MASK_OFF_0
- Offset: 0x880
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

