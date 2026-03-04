# 31 :0 0x0 MSI_CTRL_ADDR:

- Integrated MSI Reception Module Address. System specified address for MSI
memory write transaction termination. Within the AXI Bridge, every received
- Memory Write request is examined to see if it targets the MSI Address that has
been specified in this register; and also to see if it satisfies the definition of an
- MSI interrupt request. When these conditions are satisfied the Memory Write
request is marked as an MSI request. Note: This register field is sticky.

- PCIe x1/x4/x8 Root Complex
- PCIE_X<i>_RC_PF0_PORT_LOGIC_MSI_CTRL_UPPER_ADDR_OFF_0
where <i> = 1, 4, 8. Description: This register holds the integrated MSI reception module upper address.
- PCIE_X1_RC_PF0_PORT_LOGIC_MSI_CTRL_UPPER_ADDR_OFF_0
- PCIE_X4_RC_PF0_PORT_LOGIC_MSI_CTRL_UPPER_ADDR_OFF_0
- PCIE_X8_RC_PF0_PORT_LOGIC_MSI_CTRL_UPPER_ADDR_OFF_0
- Offset: 0x824
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

