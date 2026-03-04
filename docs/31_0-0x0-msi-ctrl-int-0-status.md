# 31 :0 0x0 MSI_CTRL_INT_0_STATUS:

- MSI Interrupt0 Status. When an MSI is detected for EP#i, one bit in this
register is set. The decoding of the data payload of the MSI Memory Write request determines which bit gets set. A status is bit is cleared by writing a 1 to the bit. Each bit corresponds to a single MSI Interrupt Vector.
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_1_EN_OFF_0
where <i> = 1, 4, 8. Description: This register enables integrated MSI reception module interrupt1.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_1_EN_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_1_EN_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_INT_1_EN_OFF_0
- Offset: 0x834
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

