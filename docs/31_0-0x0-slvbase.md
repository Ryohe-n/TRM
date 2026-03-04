# 31 :0 0x0 SlvBase:

- RWRL: Region Slave Base Address: This field specifies bits 63:32 of the
Base address for the region on the AXI slave interface.
- This address is compared with the incoming slave address to determine
if a region match occurs.
- APS_AST_REGION_7_MASK_LO_0
- Offset: 0x1e8
Read/Write: See table below.
- Parity Protection: N
- SCR Protection: AST_REG_7_SEC_CONTROL_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

