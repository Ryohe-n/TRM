# 31 :0 0x0 LWR_TARGET_RW_OUTBOUND:

- When HEADER_SUBSTITUTE_EN in IATU_REGION_CTRL_2_OFF_OUTBOUND_ is
'0' (normal operation): - LWR_TARGET_RW[31:n] forms MSB's of the Lower Target part of the new address of the translated region; - LWR_TARGET_RW[n-1:0] are not used. (The start address must be aligned to a CX_ATU_MIN_REGION_SIZE kB boundary, so the lower bits of the start address of the new address of the translated region (bits n-1:0) are always '0'). - n is log2(CX_ATU_MIN_REGION_SIZE). When HEADER_SUBSTITUTE_EN in
- IATU_REGION_CTRL_2_OFF_OUTBOUND_i is '1': - LWR_TARGET_RW[31:0] forms
bytes 8-11 (for 3 dword header) or bytes 12-15 (for 4 dword header) of the outbound TLP header. Usage scenarios include the transmission of Vendor
- Defined Messages where the controller determines the content of bytes 12 to 15
of the TLP header. Note: This register field is sticky.
- PCIE_IATU_CAP_PF0_ATU_CAP_IATU_UPPER_TARGET_ADDR_OFF_OUTBOUND_7_0
Description: This register holds the upper 32 bits of the start address (Upper Target part) of the new address of the translated region.
- Offset: 0xe18
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

