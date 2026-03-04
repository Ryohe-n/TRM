# 31 :21 0x0 Reserved_31_21: Reserved. 0x0 MFRIS:

- MMC FPE Receive Interrupt Status This bit is set high when an interrupt is
generated in the MMC FPE Receive Interrupt Register. This bit is cleared when all bits in this interrupt register are cleared. This bit is valid only when you select the Enable MAC Management Counters (MMC) option along with FPE support. 0x0 MFTIS:
- MMC FPE Transmit Interrupt Status This bit is set high when an interrupt is
generated in the MMC FPE Transmit Interrupt Register. This bit is cleared when all bits in this interrupt register are cleared. This bit is valid only when you select the Enable MAC Management Counters (MMC) option along with FPE support. 0x0 MDIOIS:
- MDIO Interrupt Status This bit indicates an interrupt event after the completion
of MDIO operation. To reset this bit, the application has to read this bit/Write 1 to this bit when RCWE bit of MAC_CSR_SW_Ctrl register is set. Access restriction applies. Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event. 0x0 FPEIS:
- Frame Preemption Interrupt Status This bit indicates an interrupt event during
the operation of Frame Preemption (Bits[19:16] of MAC_FPE_CTRL_STS register is set). To reset this bit, the application must clear the event in MAC_FPE_CTRL_STS that has caused the Interrupt. 0x0 Reserved_16: Reserved. 0x0 Reserved_GPIIS: Reserved. 0x0 RXSTSIS:
- Receive Status Interrupt This bit indicates the status of received packets. This bit
is set when the RWT bit is set in the MAC_Rx_Tx_Status register. This bit is cleared when the corresponding interrupt source bit is read (or corresponding interrupt source bit is written to 1 when RCWE bit of MAC_CSR_SW_Ctrl register is set) in the MAC_Rx_Tx_Status register. 0x0 TXSTSIS: Transmit Status Interrupt This bit indicates the status of transmitted packets.
- This bit is set when any of the following bits is set in the MAC_Rx_Tx_Status
register: - Excessive Collision (EXCOL) - Late Collision (LCOL) - Excessive Deferral (EXDEF) - Loss of Carrier (LCARR) - No Carrier (NCARR) - Jabber Timeout (TJT)
- This bit is cleared when the corresponding interrupt source bit is read (or
corresponding interrupt source bit is written to 1 when RCWE bit of MAC_CSR_SW_Ctrl register is set) in the MAC_Rx_Tx_Status register.

1G Ethernet Controller Core Registers
- Bit
- Reset
- Description
0x0 TSIS:
- Timestamp Interrupt Status If the Timestamp feature is enabled, this bit is set
when any of the following conditions is true: - The system time value is equal to or exceeds the value specified in the Target Time High and Low registers. - There is an overflow in the Seconds register. - The Target Time Error occurred, that is, programmed target time already elapsed. If the Auxiliary Snapshot feature is enabled, this bit is set when the auxiliary snapshot trigger is asserted. In configurations other than EQOS_CORE, when drop transmit status is enabled in
- MTL, this bit is set when the captured transmit timestamp is updated in the
- MAC_Tx_Timestamp_Status_Nanoseconds and
- Mac_TxTimestamp_Status_Seconds registers. When PTP offload feature is
enabled, this bit is set when the captured transmit timestamp is updated in the
- MAC_Tx_Timestamp_Status_Nanoseconds and
- MAC_Tx_Timestamp_Status_Seconds registers, for PTO generated Delay Request
and Pdelay request packets. This bit is cleared when the corresponding interrupt source bit is read (or corresponding interrupt source bit is written to 1 when
- RCWE bit of MAC_CSR_SW_Ctrl register is set) in the MAC_Timestamp_Status
register. 0x0 MMCRXIPIS:
- MMC Receive Checksum Offload Interrupt Status This bit is set high when an
interrupt is generated in the MMC Receive Checksum Offload Interrupt Register.
- This bit is cleared when all bits in this interrupt register are cleared. This bit is
valid only when you select the Enable MAC Management Counters (MMC) and Enable Receive TCP/IP Checksum Check options. 0x0 MMCTXIS:
- MMC Transmit Interrupt Status This bit is set high when an interrupt is generated
in the MMC Transmit Interrupt Register. This bit is cleared when all bits in this interrupt register are cleared. This bit is valid only when you select the Enable MAC Management Counters (MMC) option. 0x0 MMCRXIS:
- MMC Receive Interrupt Status This bit is set high when an interrupt is generated
in the MMC Receive Interrupt Register. This bit is cleared when all bits in this interrupt register are cleared. This bit is valid only when you select the Enable MAC Management Counters (MMC) option. 0x0 MMCIS: MMC Interrupt Status This bit is set high when Bit 11, Bit 10, or Bit 9 is set high.
- This bit is cleared only when all these bits are low. This bit is valid only when you
select the Enable MAC Management Counters (MMC) option. 7:6 0x0 Reserved_7_6: Reserved. 0x0 LPIIS:
- LPI Interrupt Status When the Energy Efficient Ethernet feature is enabled, this
bit is set for any LPI state entry or exit in the MAC Transmitter or Receiver. This bit is cleared when the corresponding interrupt source bit of
- MAC_LPI_Control_Status register is read (or corresponding interrupt source bit of
- MAC_LPI_Control_Status register is written to 1 when RCWE bit of
MAC_CSR_SW_Ctrl register is set). 0x0 PMTIS:
- PMT Interrupt Status This bit is set when a Magic packet or Wake-on-LAN packet
is received in the power-down mode (RWKPRCVD and MGKPRCVD bits in
- MAC_PMT_Control_Status register). This bit is cleared when corresponding
interrupt source bit are cleared because of a Read operation to the
- MAC_PMT_Control_Status register (or corresponding interrupt source bit of
- MAC_PMT_Control_Status register is written to 1 when RCWE bit of
- MAC_CSR_SW_Ctrl register is set). This bit is valid only when you select the
Enable Power Management option.

1G Ethernet Controller Core Registers
- Bit
- Reset
- Description
0x0 PHYIS: PHY Interrupt This bit is set when rising edge is detected on the phy_intr_i input.
- This bit is cleared when this register is read (or this bit is written to 1 when RCWE
bit of MAC_CSR_SW_Ctrl register is set). 0x0 Reserved_PCSANCIS: Reserved. 0x0 Reserved_PCSLCHGIS: Reserved. 0x0 RGSMIIIS:
- RGMII or SMII Interrupt Status This bit is set because of any change in value of
the Link Status of RGMII or SMII interface (LNKSTS bit in
- MAC_PHYIF_Control_Status register). This bit is cleared when the
- MAC_PHYIF_Control_Status register is read (or LNKSTS bit of
- MAC_PHYIF_Control_Status register is written to 1 when RCWE bit of
- MAC_CSR_SW_Ctrl register is set). This bit is valid only when you select the
optional RGMII or SMII PHY interface.
- EQOS_EQOS_MAC_MAC_INTERRUPT_ENABLE_0
The Interrupt Enable register contains the masks for generating the interrupts.
- Offset: 0xb4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

