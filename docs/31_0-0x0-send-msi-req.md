# 31 :0 0x0 SEND_MSI_REQ:

- SELF-CLEAR : When a bit is set, corresponding MSI Vector is sent out as a
- MSI msg, Is the vector is masked, corresponding bit is set in
CFG_MSI_PENDING. Writing 0 has no effect.
- PCIE_RP_APPL_MSI_CTRL_2_0

- PCIe Root Port
- Offset: 0xb0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

