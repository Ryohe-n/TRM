# 6 :4 X BEAT_SIZE: 000:Each beat of burst = 1 byte wide 001:Each beat of burst = 2 byte wide 010:Each beat of burst = 4 byte wide 011:Each beat of burst = 8 byte wide 100:Each beat of burst = 16 byte wide 101:Each beat of burst = 32 byte wide (not supported) 110:Each beat of burst = 64 byte wide (not supported) 111:Each beat of burst = 128 byte wide (not supported) X RW: 0:Read Access 1:Write Access

- RCE_MN_DMA_P_I_LOG_ATTRIBUTES1_0
This register stores the additional access attributes for the access that returned with error. This register exists only when Error Monitor is built with the Error Logger. Write accesses to this register return error.
- Offset: 0x14310
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x000000XX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

