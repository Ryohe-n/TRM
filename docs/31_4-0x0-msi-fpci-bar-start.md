# 31 :4 0x0 MSI_FPCI_BAR_START:

- The start of upstream FPCI address space for MSI BAR. The upstream FPCI
address is compared to start/1KB range for MSI BAR to determine if the access is MSI. Bits 31:4 of MSI BAR start correspond to UFPCI address bits 39:12.
- HDA_MSI_VEC0_0
- MSI VECTORi, i in [0,7], RW
- Offset: 0x100
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

