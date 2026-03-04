# 31 :26 0x0 Reserved_31_26: Reserved. 25:24 0x0 LS:

- Link Status. When current Mode is not RGMII : These bits indicate the current
link status received on the XGMII receive interface. - 2'b00: Link OK - 2'b01:
- Reserved - 2'b10: Local link fault - 2'b11: Remote link fault The bits [27:26] are
reserved When current mode is RGMII: Bit[27]: - 0: Link Down - 1: Link Up
- Bit[26:25]: - 2'b00: 10Mbps - 2'b01: 100Mbps - 2'b10: 1Gbps - 2'b11: Reserved
- Bit[24]: - 0: Half Duplex - 1: Full Duplex
0x0 PCIS:
- Policing Counter Interrupt Status This bit is set high when an interrupt is
generated in the MAC_PCTH_Intr_Status or MAC_PCTW_Intr_Status Register.
- This bit is cleared when all bits in MAC_PCTH_Intr_Status or
MAC_PCTW_Intr_Status register are cleared. 22:19 0x0 Reserved_22_19: Reserved. 0x0 MFRIS:
- MMC FPE Receive Interrupt Status This bit is set high when an interrupt is
generated in the MMC FPE Receive Interrupt Register. This bit is cleared when all bits in this interrupt register are cleared. This bit is valid only when you select the Enable MAC Management Counters (MMC) option along with FPE support. 0x0 MFTIS:
- MMC FPE Transmit Interrupt Status This bit is set high when an interrupt is
generated in the MMC FPE Transmit Interrupt Register. This bit is cleared when all bits in this interrupt register are cleared. This bit is valid only when you select the Enable MAC Management Counters (MMC) option along with FPE support. 0x0 FPEIS:
- Frame Preemption Interrupt Status This bit indicates an interrupt event during
the operation of Frame Preemption (Bits[19:16] of MAC_FPE_CTRL_STS register is set). To reset this bit, the application must clear the event in MAC_FPE_CTRL_STS that has caused the interrupt. 0x0 GPIIS:
- GPI Interrupt Status. When the GPIO feature is enabled, this bit is set when an
active event (LL or LH) occurs on the GPIS field of the MAC_GPIO_Status register and the corresponding GPIE bit is enabled in the MAC_GPIO_Control register. This bit is cleared on reading lane 0 (GPIS) of the MAC_GPIO_Status register. 0x0 RXESIS:
- Receive Error Status Interrupt. This bit indicates the error status of received
packets. This bit is set when the Watchdog Timeout (WDT) event occurs during reception. Access restriction applies.This bit is cleared when the corresponding interrupt source bit is read (or corresponding interrupt source bit is written to 1 when RCWE bit of MAC_CSR_SW_Ctrl register is set) in the MAC_Rx_Tx_Status register. 0x0 TXESIS:
- Transmit Error Status Interrupt. - This bit indicates the error status of
transmitted packets. This bit is set when any of the following bits is set in the
- MAC_Rx_Tx_Status during transmission. - Excessive Collision (EXCOL) - Late
- Collision (LCOL) - Excessive Deferral (EXDEF) - Loss of Carrier (LCARR) - No
- Carrier (NCARR) - Jabber Timeout (TJT) Access restriction applies.This bit is
cleared when the corresponding interrupt source bit is read (or corresponding interrupt source bit is written to 1 when RCWE bit of MAC_CSR_SW_Ctrl register is set) in the MAC_Rx_Tx_Status register.

10G Ethernet Controller Core Registers
- Bit
- Reset
- Description
0x0 TSIS:
- Timestamp Interrupt Status. If the Timestamp feature is enabled, this bit is set
when any of the following conditions is true: - The system time value is equal to or exceeds the value specified in the Target Time High and Low registers. -
- There is an overflow in the Seconds register. - The Target Time Error occurred,
that is, programmed target time already elapsed. - When a timestamp of a transmitted PTP packet is available in the MAC_TxTimestamp_Status_Seconds register. If the Auxiliary Snapshot feature is enabled, this bit is set when the auxiliary snapshot trigger is asserted. Access restriction applies.This bit is cleared when the corresponding interrupt source bit is read (or corresponding interrupt source bit is written to 1 when RCWE bit of MAC_CSR_SW_Ctrl register is set) in the MAC_Timestamp_Status register. 0x0 MMCRXIPIS:
- MMC Receive Checksum Offload Interrupt Status This bit is set high when an
interrupt is generated in the MMC Receive Checksum Offload Interrupt Register. This bit is cleared when all bits in this interrupt register are cleared.
- This bit is valid only when you select the Enable MAC Management Counters
(MMC) and Enable Receive TCP/IP Checksum Check options. 0x0 MMCTXIS:
- MMC Transmit Interrupt Status. This bit is set high when an interrupt is
generated in the MMC Transmit Interrupt register. This bit is cleared when all bits in this interrupt register are cleared. This bit is valid only when you select the Enable DWC_xgmac Management Counter (MMC) option. 0x0 MMCRXIS:
- MMC Receive Interrupt Status. This bit is set high when an interrupt is
generated in the MMC Receive Interrupt register. This bit is cleared when all bits in this interrupt register are cleared. This bit is valid only when you select the Enable DWC_xgmac Management Counter (MMC) option. 8:6 0x0 Reserved_8_6: Reserved. 0x0 LPIIS:
- LPI Interrupt Status. When the Energy Efficient Ethernet feature is enabled, this
bit is set for any LPI state entry or exit in the MAC Transmitter or Receiver. In all other modes, this bit is reserved. Note: On the transmit side the Exit Interrupt is generate only when the XGMII/GMII interface comes out of the LPI and TW timer expires. Access restriction applies.This bit is cleared when the corresponding interrupt source bit of MAC_LPI_Control_Status register is read (or corresponding interrupt source bit of MAC_LPI_Control_Status register is written to 1 when RCWE bit of MAC_CSR_SW_Ctrl register is set). 0x0 PMTIS:
- PMT Interrupt Status. This bit is set when a Magic packet or Wake-on-LAN
packet is received in the power-down mode (RWKPRCVD and MGKPRCVD bits in
- MAC_PMT_Control_Status register). This bit is cleared when Bits[6:5] are
cleared because of a Read operation to the MAC_PMT_Control_Status register. This bit is valid only when you select the Enable Power Management option.
- Access restriction applies.This bit is cleared when Bits[6:5] of
- MAC_PMT_Control_Status register is read (or corresponding interrupt source
bit of MAC_PMT_Control_Status register is written to 1 when RCWE bit of MAC_CSR_SW_Ctrl register is set). 3:2 0x0 Reserved_3_2: Reserved. 0x0 SMI:
- SMA Interrupt. This bit is set when any of the bits in the MDIO Interrupt Status
register is set. This bit is the logical OR of all the bits in that register and is cleared only when all the bits in the MDIO Interrupt register are cleared

10G Ethernet Controller Core Registers
- Bit
- Reset
- Description
0x0 LSI:
- Link Status change Interrupt. This bit is set when the LS (Link Status) bits
change their value. It is cleared when this register is read. This interrupt is generated in RGMII mode when the link status change is detected in the RGMII
- Rx Interface. Access restriction applies. Clears on read (or write of 1 when
RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event.
- MGBE_DWCXG_CORE_MAC_INTERRUPT_ENABLE_0
The Interrupt Enable register contains the masks for generating the interrupts.
- Offset: 0xb4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000001 (0b0000,0000,0000,0000,0000,0000,0000,0001)
- Bit
R/W
- Reset
- Description

