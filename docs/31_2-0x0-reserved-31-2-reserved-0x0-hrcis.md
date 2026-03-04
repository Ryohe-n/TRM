# 31 :2 0x0 Reserved_31_2: Reserved. 0x0 HRCIS:

- MMC Tx Hold Request Counter Interrupt Status This bit is set when the
- Tx_Hold_Req_Cntr counter reaches the threshold value programmed in MMC
control register. Access restriction applies. Clears on read. Self-set to 1 on internal event. 0x0 FCIS:
- MMC Tx FPE Fragment Counter Interrupt status This bit is set when the
- Tx_FPE_Fragment_Cntr counter reaches the threshold value programmed in
- MMC control register. Access restriction applies. Clears on read. Self-set to 1
on internal event. Exists when any one of the Rx/Tx MMC counters are enabled during FPE Enabled configuration.
- MGBE_DWCXG_CORE_MMC_FPE_TX_INTERRUPT_MASK_0
This register maintains the masks for interrupts generated from all FPE related Transmit statistics counters. The MMC Receive Interrupt Mask register maintains the masks for the interrupts generated when FPE related receive statistic counters reach the threshold value programmed in MMC control register. This register is 32 bit wide.
- Offset: 0xa04
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

