# 31 :12 0x0 MSI_AXI_BAR_START:

- The start of upstream AXI address space for MSI BAR. The upstream FPCI
address is compared to start/1KB range for MSI BAR to determine if the access is MSI. Bits 31:12 of MSI BAR start correspond to AXI address bits 31:12.
- HDA_MSI_FPCI_BAR_ST_0

- HDA Registers
- MSI FPCI BAR START
- Offset: 0xc8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,xxxx)
- Bit
- Reset
- Description

