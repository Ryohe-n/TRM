# 1 Register. Could be used by your application in a downstream port to determine when not to drive CLKREQ# such as when L1 Substates are not enabled. 0x0 CFG_HW_AUTO_SP_DIS: 0x0 CFG_BUS_MASTER_EN:

- The state of the bus master enable bit in the PCI-compatible Command
register. There is 1 bit of cfg_bus_master_en assigned to each configured function.
- PCIE_RP_APPL_CFG_STATUS1_0

- PCIe Root Port
- Offset: 0xe0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

