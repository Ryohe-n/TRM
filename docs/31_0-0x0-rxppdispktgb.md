# 31 :0 0x0 RXPPDISPKTGB:

- Rx Good Bad Per Priority Discarded Packets Count This field indicates the
packets received and discarded (due to filter fail) for each priority. This field is incremented irrespective of whether it is a good or bad packet.
- MGBE_DWCXG_CORE_MMC_FPE_TX_INTERRUPT_0

10G Ethernet Controller Core Registers cont'd 1 This register maintains the interrupts generated from all FPE related Transmit statistics counters. The MMC FPE Transmit Interrupt register maintains the interrupts generated when the transmit statistic counters reach the threshold value programmed in MMC control register (for example, the counter's MSB is set). This register is 32 bits wide. An interrupt bit is cleared when the respective MMC counter that caused the interrupt is read. The least significant byte lane (bits[7:0]) of the corresponding counter must be read to clear the interrupt status bit.
- Offset: 0xa00
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

