# 31 :0 0x0 UPPER_BASE_RW:

- Forms bits [63:32] of the start (and end) address of the address region to be
translated. In systems with a 32-bit address space, this register is not used and therefore writing to this register has no effect. Note: This register field is sticky.
- PCIE_IATU_CAP_PF0_ATU_CAP_IATU_LIMIT_ADDR_OFF_OUTBOUND_7_0
Description: This register holds the end address of the address region to be translated.
- Offset: 0xe10
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0000ffff (0b0000,0000,0000,0000,1111,1111,1111,1111)
- Bit
R/W
- Reset
- Description

