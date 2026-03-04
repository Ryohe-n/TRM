# 31 :0 0x0 MSI_GPIO_REG:

- MSI GPIO Register. The contents of this register drive the top-level GPIO
msi_ctrl_io[31:0]. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PORT_LOGIC_CLOCK_GATING_CTRL_OFF_0
where <i> = 1, 4, 8. Description: This register enables you to disable dynamic clock gating. By default dynamic clock gating is on, allowing the controller to autonomously enable and disable its clocks. The clock gating is performed in the clock and reset module, DWC_pcie_clk_rst.v, and is initiated by the controllers clock enable signals. The following modules support dynamic clock gating: - AXI Bridge - RADM.
- PCIE_X1_RC_PF0_PORT_LOGIC_CLOCK_GATING_CTRL_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_CLOCK_GATING_CTRL_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_CLOCK_GATING_CTRL_OFF_0
- Offset: 0x88c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000003 (0b0000,0000,0000,0000,0000,0000,0000,0011)
- Bit
R/W
- Reset
- Description

