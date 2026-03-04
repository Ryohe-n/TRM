# 15 and 14, decide the set of PTP packet types for which snapshot needs to be taken.

- RW
0x0 TSMSTRENA:
- Enable Snapshot for Messages Relevant to Master. When this bit is
set, the snapshot is taken only for the messages that are relevant to the master node. Otherwise, the snapshot is taken for the messages relevant to the slave node.
- RW
0x0 TSEVNTENA:
- Enable Timestamp Snapshot for Event Messages. When this bit is
set, the timestamp snapshot is taken only for event messages (SYNC,
- Delay_Req, Pdelay_Req, or Pdelay_Resp). When this bit is reset, the
snapshot is taken for all messages except Announce, Management, and Signaling.
- RW
0x1 TSIPV4ENA:
- Enable Processing of PTP Packets Sent over IPv4-UDP. When this bit
is set, the MAC receiver processes the PTP packets encapsulated in
- IPv4-UDP packets. When this bit is reset, the MAC ignores the PTP
transported over IPv4-UDP packets. This bit is set by default.
- RW
0x0 TSIPV6ENA:
- Enable Processing of PTP Packets Sent over IPv6-UDP. When this bit
is set, the MAC receiver processes the PTP packets encapsulated in
- IPv6-UDP packets. When this bit is clear, the MAC ignores the PTP
transported over IPv6-UDP packets.
- RW
0x0 TSIPENA:
- Enable Processing of PTP over Ethernet Packets. When this bit is set,
the MAC receiver processes the PTP packets encapsulated directly in the Ethernet packets. When this bit is reset, the MAC ignores the PTP over Ethernet packets.
- RW
0x0 TSVER2ENA:
- Enable PTP Packet Processing for Version 2 Format. When this bit is
set, the IEEE 1588 version 2 format is used to process the PTP packets. When this bit is reset, the IEEE 1588 version 1 format is used to process the PTP packets. The IEEE 1588 formats are described in "PTP Processing and Control" section.
- RW
0x0 TSCTRLSSR:
- Timestamp Digital or Binary Rollover Control. When this bit is set, the
- Timestamp Low register rolls over after 0x3B9A_C9FF value (that is, 1
nanosecond accuracy) and increments the timestamp (High) seconds.
- When this bit is reset, the rollover value of sub-second register is
0x7FFF_FFFF. The sub-second increment must be programmed correctly depending on the PTP reference clock frequency and the value of this bit.

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description
- RW
0x0 TSENALL:
- Enable Timestamp for All Packets. When this bit is set, the
timestamp snapshot is enabled for all packets received by the MAC. 7:6
- RO
0x0 Reserved_7_6: Reserved.
- RW
0x0 TSADDREG:
- Update Addend Register. When this bit is set, the content of the
- Timestamp Addend register is updated in the PTP block for fine
correction. This bit is cleared when the update is complete. This bit should be zero before it is set.
- RO
0x0 Reserved_TSTRIG: Reserved.
- RW
0x0 TSUPDT:
- Update Timestamp. When this bit is set, the system time is updated
(added or subtracted) with the value specified in
- MAC_System_Time_Seconds_Update and
- MAC_System_Time_Nanoseconds_Update. This bit should be zero
before updating it. This bit is reset when the update is complete in hardware. The Timestamp Higher Word register (if enabled during controller configuration) is not updated.
- RW
0x0 TSINIT:
- Initialize Timestamp. When this bit is set, the system time is
initialized (overwritten) with the value specified in the
- MAC_System_Time_Seconds_Update and
- MAC_System_Time_Nanoseconds_Update registers. This bit should
be zero before it is updated. This bit is reset when the initialization is complete. The Timestamp Higher Word register (if enabled during controller configuration) can only be initialized.
- RW
0x0 TSCFUPDT:
- Fine or Coarse Timestamp Update. When this bit is set, the Fine
method is used to update system timestamp. When this bit is reset, Coarse method is used to update the system timestamp.
- RW
0x0 TSENA:
- Enable Timestamp. When this bit is set, the timestamp is added for
- Transmit and Receive packets. When disabled, timestamp is not
added for transmit and receive packets and the Timestamp
- Generator is also suspended. You need to initialize the Timestamp
(system time) after enabling this mode. On the Receive side, the MAC processes the 1588 packets only if this bit is set.
- MGBE_DWCXG_CORE_MAC_SUB_SECOND_INCREMENT_0
- The Sub-Second Increment register is present only when the IEEE 1588 timestamp feature is
selected without an external timestamp input. In Coarse Update mode [Bit 1 in MAC_Timestamp_Control register], the value in this register is added to the system time every clock cycle of clk_ptp_ref_i. In Fine Update mode, the value in this register is added to the system time when the Accumulator gets an overflow.

10G Ethernet Controller Core Registers cont'd 1
- Offset: 0xd04
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

