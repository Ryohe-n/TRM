# 31 :4 0x0 FPCI_BAR3_START:

- The start of FPCI address space mapped into the BARi range of PCI
memory space. The 40-bit FPCI address is determined by a shift left 12 of the value of this register. 0x1 FPCI_BAR3_ACCESS_TYPE:
- Indicates if the address region is memory mapped versus configuration or
IO space. 0 = Memory mapped access (PW only) 1 = IO/config access (NPW only)
- HDA_MSI_BAR_SZ_0
- MSI BAR SIZE
- Offset: 0xc0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

