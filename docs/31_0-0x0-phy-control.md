# 31 :0 0x0 PHY_CONTROL:

- PHY Control. Data sent directly to the cfg_phy_control bus. This is a GPIO
register driving the values on the static cfg_phy_control output signals, and does not in any way influence controller functionality. It can be used for any static sideband control signaling requirements that you have for your PHY. Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_PORT_LOGIC_TRGT_MAP_CTRL_OFF_0
where <j> = 4, 8. Description:This register controls the target map.
- PCIE_X4_EP_PF0_PORT_LOGIC_TRGT_MAP_CTRL_OFF_0
- PCIE_X8_EP_PF0_PORT_LOGIC_TRGT_MAP_CTRL_OFF_0
- Offset: 0x81c
- Read/Write: See table below

- PCIe x4/x8 Endpoint
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0000006b (0b0000,0000,0000,0000,000x,xxxx,x110,1011)
- Bit
R/W
- Reset
- Description

