# 31 :4 0x0 Reserved_31_4: Reserved. 0x0 FCIS:

- MMC Rx FPE Fragment Counter Interrupt Status This bit is set when the
- Rx_FPE_Fragment_Cntr counter reach the threshold value programmed in
- MMC control register. Access restriction applies. Clears on read. Self-set to 1
on internal event. Exists when any one of the Rx/Tx MMC counters are enabled during FPE Enabled configuration. 0x0 PAOCIS:
- MMC Rx Packet Assembly OK Counter Interrupt Status This bit is set when
the Rx_Packet_Assemble_Ok_Cntr counter reach the threshold value programmed in MMC control register. Access restriction applies. Clears on read. Self-set to 1 on internal event. Exists when any one of the Rx/Tx MMC counters are enabled during FPE Enabled configuration. 0x0 PSECIS:
- MMC Rx Packet SMD Error Counter Interrupt Status This bit is set when the
- Rx_Packet_SMD_Err_Cntr counter reaches the threshold value programmed
in MMC control register. Access restriction applies. Clears on read. Self-set to 1 on internal event. Exists when any one of the Rx/Tx MMC counters are enabled during FPE Enabled configuration. 0x0 PAECIS:
- MMC Rx Packet Assembly Error Counter Interrupt Status This bit is set when
the Rx_Packet_Assemble_Err_Cntr counter reaches the threshold value programmed in MMC control register. Access restriction applies. Clears on read. Self-set to 1 on internal event. Exists when any one of the Rx/Tx MMC counters are enabled during FPE Enabled configuration.
- MGBE_DWCXG_CORE_MMC_FPE_RX_INTERRUPT_MASK_0

10G Ethernet Controller Core Registers cont'd 1 This register maintains the masks for interrupts generated from all FPE related Receive statistics counters. The MMC Receive Interrupt Mask register maintains the masks for the interrupts generated when FPE related receive statistic counters reach the threshold value programmed in MMC control register. This register is 32 bit wide.
- Offset: 0xa24
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

