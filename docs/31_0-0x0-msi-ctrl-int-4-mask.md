# 31 :0 0x0 MSI_CTRL_INT_4_MASK:

- MSI Interrupt4 Mask. Allows enabled interrupts to be masked. When an MSI
is received for a masked interrupt, the corresponding status bit gets set in the interrupt status register but the msi_ctrl_int output is not set HIGH. Each bit corresponds to a single MSI Interrupt Vector. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_4_STATUS_OFF_0
where <i> = 1, 4, 8. Description: This register provides the MSI Interrupt4 status.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_4_STATUS_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_4_STATUS_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_4_STATUS_OFF_0
- Offset: 0x860
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

