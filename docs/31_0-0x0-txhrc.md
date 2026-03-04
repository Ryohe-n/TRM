# 31 :0 0x0 TXHRC:

- Tx Hold Request Counter This field indicates count of number of a hold
request is given to MAC.

10G Ethernet Controller Core Registers cont'd 1
- MGBE_DWCXG_CORE_MMC_FPE_RX_INTERRUPT_0
This register maintains the interrupts generated from all FPE related Receive statistics counters. The MMC FPE Receive Interrupt register maintains the interrupts generated when receive statistic counters reach the threshold value programmed in MMC control register (for example, the counter's MSB is set). The MMC FPE Receive Interrupt register is a 32 bit register. An interrupt bit is cleared when the respective MMC counter that caused the interrupt is read. The least significant byte lane (Bits[7:0]) of the respective counter must be read to clear the interrupt bit.
- Offset: 0xa20
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

