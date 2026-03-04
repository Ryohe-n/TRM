# 31 :0 0x0 RXICMPERROCT:

- RxICMP Error Octets This field indicates the number of bytes received in a
- ICMP segment that had checksum errors. This counter does not count IP
header bytes.
- EQOS_EQOS_MAC_MMC_FPE_TX_INTERRUPT_0
This register maintains the interrupts generated from all FPE related Transmit statistics counters.
- The MMC FPE Transmit Interrupt register maintains the interrupts generated when transmit

1G Ethernet Controller Core Registers statistic counters reach half their maximum values (0x8000_0000 for 32 bit counter and 0x8000 for 16 bit counter), and when they cross their maximum values (0xFFFF_FFFF for 32-bit counter and 0xFFFF for 16-bit counter). When Counter Stop Rollover is set, the interrupts are set but the counter remains at all-ones. The MMC FPE Transmit Interrupt register is a 32 bit register. An interrupt bit is cleared when the respective MMC counter that caused the interrupt is read. The least significant byte lane (Bits[7:0]) of the respective counter must be read to clear the interrupt bit.
- Offset: 0x8a0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

