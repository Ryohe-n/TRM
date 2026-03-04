# 31 :0 0x0 PHY_STATUS:

- PHY Status. Data received directly from the phy_cfg_status bus. These is a
GPIO register reflecting the values on the static phy_cfg_status input signals.
- The usage is left completely to the user and does not in any way influence
controller functionality. You can use it for any static sideband status signalling requirements that you have for your PHY. Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_PORT_LOGIC_PHY_CONTROL_OFF_0
where <j> = 4, 8. Description:Memory mapped register to cfg_phy_control GPIO output pins.
- PCIE_X4_EP_PF0_PORT_LOGIC_PHY_CONTROL_OFF_0
- PCIE_X8_EP_PF0_PORT_LOGIC_PHY_CONTROL_OFF_0
- Offset: 0x814
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

