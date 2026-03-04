# 19 :16 0x0 Reserved_ATSSTN: Reserved. 0x0 TXTSSIS:

- Tx Timestamp Status Interrupt Status In non-EQOS_CORE configurations when
drop transmit status is enabled in MTL, this bit is set when the captured transmit timestamp is updated in the
- MAC_Tx_Timestamp_Status_Nanoseconds and
- MAC_Tx_Timestamp_Status_Seconds registers. When PTP offload feature is
enabled, this bit is set when the captured transmit timestamp is updated in the
- MAC_Tx_Timestamp_Status_Nanoseconds and
- MAC_Tx_Timestamp_Status_Seconds registers, for PTO generated Delay
- Request and Pdelay request packets. This bit is cleared when the
- MAC_Tx_Timestamp_Status_Seconds register is read (or write to
- MAC_Tx_Timestamp_Status_Seconds register when RCWE bit of
MAC_CSR_SW_Ctrl register is set). 14:10 0x0 Reserved_14_10: Reserved. 0x0 Reserved_TSTRGTERR3: Reserved. 0x0 Reserved_TSTARGT3: Reserved. 0x0 Reserved_TSTRGTERR2: Reserved. 0x0 Reserved_TSTARGT2: Reserved. 0x0 TSTRGTERR1:
- Timestamp Target Time Error This bit is set when the latest target time
programmed in the MAC_PPS1_Target_Time_Seconds and
- MAC_PPS1_Target_Time_Nanoseconds registers elapses. This bit is cleared
when the application reads this bit. Access restriction applies. Clears on read (or this bit is written to 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event. 0x0 TSTARGT1:
- Timestamp Target Time Reached for Target Time PPS1 When this bit is set and
- MCGREN1 of MAC_PPS_Control register is reset, it indicates that the value of
system time is greater than or equal to the value specified in the
- MAC_PPS1_Target_Time_Seconds and MAC_PPS1_Target_Time_Nanoseconds
registers. When this bit is set and MCGREN1 of MAC_PPS_Control register is set, it indicates that mcgr_dma_req_o[1] is asserted. Access restriction applies.
- Clears on read (or this bit is written to 1 when RCWE bit in MAC_CSR_SW_Ctrl
register is set). Self-set to 1 on internal event. 0x0 TSTRGTERR0:
- Timestamp Target Time Error This bit is set when the latest target time
programmed in the MAC_PPS0_Target_Time_Seconds and
- MAC_PPS0_Target_Time_Nanoseconds registers elapses. This bit is cleared
when the application reads this bit. Access restriction applies. Clears on read (or this bit is written to 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event.

1G Ethernet Controller Core Registers
- Bit
- Reset
- Description
0x0 AUXTSTRIG:
- Auxiliary Timestamp Trigger Snapshot This bit is set high when the auxiliary
snapshot is written to the FIFO. This bit is valid only if the Add IEEE 1588
- Auxiliary Snapshot option is selected. Access restriction applies. Clears on read
(or this bit is written to 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event. 0x0 TSTARGT0:
- Timestamp Target Time Reached When this bit is set and MCGREN0 of
- MAC_PPS_Control register is reset, it indicates that the value of system time is
greater than or equal to the value specified in the
- MAC_PPS0_Target_Time_Seconds and MAC_PPS0_Target_Time_Nanoseconds
registers. When this bit is set and MCGREN0 of MAC_PPS_Control register is set, it indicates that mcgr_dma_req_o[0] is asserted. Access restriction applies.
- Clears on read (or this bit is written to 1 when RCWE bit in MAC_CSR_SW_Ctrl
register is set). Self-set to 1 on internal event. 0x0 TSSOVF:
- Timestamp Seconds Overflow When this bit is set, it indicates that the seconds
value of the timestamp (when supporting version 2 format) has overflowed beyond 32'hFFFF_FFFF. Access restriction applies. Clears on read (or this bit is written to 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event.
- EQOS_EQOS_MAC_MAC_TX_TIMESTAMP_STATUS_NANOSECONDS_0
This register contains the nanosecond part of timestamp captured for Transmit packets when Tx status is disabled. The MAC_Tx_Timestamp_Status_Nanoseconds register, along with
- MAC_Tx_Timestamp_Status_Seconds, gives the 64-bit timestamp captured for the PTP packet
successfully transmitted by the MAC. This value is considered to be read by the application when the last byte of MAC_Tx_Timestamp_Status_Nanoseconds is read. In the little-endian mode, this means when bits[31:24] are read; in big-endian mode, bits[7:0] are read. If the application does not read these registers and timestamp of another packet is captured, then either the current timestamp is lost (overwritten) or the new timestamp is lost (dropped), depending on the setting of the TXTSSTSM bit of the MAC_Timestamp_Control register. The status bit TXTSSIS bit [15] in
- MAC_Timestamp_Status register is set when the MAC transmitter captures the timestamp.)
- Offset: 0xb30
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

1G Ethernet Controller Core Registers
- Bit
- Reset
- Description
0x0 TXTSSMIS:
- Transmit Timestamp Status Missed When this bit is set, it indicates one of the
following: - The timestamp of the current packet is ignored if TXTSSTSM bit of the MAC_Timestamp_Control register is reset - The timestamp of the previous packet is overwritten with timestamp of the current packet if TXTSSTSM bit of the MAC_Timestamp_Control register is set. Access restriction applies. Clears on read. Self-set to 1 on internal event. 30:0 0x0 TXTSSLO:
- Transmit Timestamp Status Low This field contains the 31 bits of the
Nanoseconds field of the Transmit packet's captured timestamp.
- EQOS_EQOS_MAC_MAC_TX_TIMESTAMP_STATUS_SECONDS_0
- The register contains the higher 32 bits of the timestamp (in seconds) captured when a PTP
packet is transmitted.
- Offset: 0xb34
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

