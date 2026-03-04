# 31 :0 X ERR_ADDR_LOW:

- Indicates the lower 32 bits of address for which the Error Monitor
detected the inband error.
- RCE_MN_DMA_P_I_LOG_ADDR_HIGH_0
- This register stores the upper bits of the Address for the access which returned the error
This register exists only when Error Monitor is built with the Error Logger. Write accesses to this register return error.
- Offset: 0x14308
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xXXXXXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)

- RCE Fabric Registers
- Bit
- Reset
- Description

