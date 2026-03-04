# 31 :0 0x0 CFG_MSI_PENDING: WRITE-ONE-CLEAR : Current status of the MSI Pending bits set by HW. Write 1 to clear the bit once remote RP SW has handled the interrupt.

- Writing 0 has no effect on the bits. This bit is set if a requested interrupt is
masked or a unmasked interrupt is waiting for arbiteration.
- PCIE_RP_APPL_MSI_CTRL_3_0
- Offset: 0xb4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xx00,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description

