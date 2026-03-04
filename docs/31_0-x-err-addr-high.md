# 31 :0 X ERR_ADDR_HIGH:

- Indicates the upper 32 bits of address for which the Error Monitor
detected the inband error.
- Assuming max physical address bits supported by SoC=ADDR_WIDTH,
ERR_ADDR_HI[63:ADDR_WIDTH] will be 0.
- RCE_MN_DMA_P_I_LOG_ATTRIBUTES0_0
This register stores the access attributes for the access that returned with error. This register exists only when Error Monitor is built with the Error Logger. Write accesses to this register return error.
- Offset: 0x1430c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0XXXXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

