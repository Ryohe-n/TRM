# 31 :12 0x0 MastBase:

- RWRL: Region Master Base Address: This field specifies bits 31:12 of
the Base address for the region on the AXI Master interface. The Output address is generated using the following equation.
- OutputAddress[63:12]= (InputAddress[63:12] & Mask[N]) |
(MastBase[N] & !Mask[N])
- APS_AST_REGION_7_MASTER_BASE_HI_0
- Offset: 0x1f4
Read/Write: See table below.
- Parity Protection: N
- SCR Protection: AST_REG_7_SEC_CONTROL_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

