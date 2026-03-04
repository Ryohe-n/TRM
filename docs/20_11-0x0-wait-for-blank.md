# 20 :11 0x0 WAIT_FOR_BLANK:

- Additional control for DVFS; if set, ready_for_latency is asserted only if
- COUNT_THRESHOLD is met and also all channels at CHANSEL are not in
frame and is asserted for a limited time (the value of this field, in units of 2^8 VICLKs). 10:0 0x5 COUNT_THRESHOLD:
- Indicates that VI is ready for latency event if number of entries
in the FIFO is less than COUNT_THRESHOLD
- VI_CFG_MEMORY_BATCH_MASK_0
- Offset: 0x102b
- Byte Offset: 0x40ac
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xfffffc00 (0b1111,1111,1111,1111,1111,1100,0000,0000)
- Bit
- Reset
- Description

