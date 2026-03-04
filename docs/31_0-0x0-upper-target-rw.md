# 31 :0 0x0 UPPER_TARGET_RW:

- Forms bits [63:32] of the start address (Upper Target part) of the new
address of the translated region. Note: This register field is sticky.

- PCIe iATU
- PCIE_IATU_CAP_PF0_ATU_CAP_IATU_UPPR_LIMIT_ADDR_OFF_OUTBOUND_7_0
Description: The CX_MAX_ATU_REGION_SIZE configuration parameter (Value Range: 0->32, 8=1TB) specifies the maximum region size of an address translation region. This register is only used when the INCREASE_REGION_SIZE field in IATU_REGION_CTRL_1_OFF_OUTBOUND_i is '1'.
- Offset: 0xe20
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

