# 31 :0 0x0 TSTRH0: PPS0 Target Time Seconds Register. This field stores the time in seconds.

- When the timestamp value matches or exceeds both Target Timestamp
registers, the MAC starts or stops the PPS signal output and generates an interrupt (if enabled) based on Bits[6:5] of MAC_PPS_Control register.
- MGBE_DWCXG_CORE_MAC_PPS0_TARGET_TIME_NANOSECONDS_0
- The PPS0 Target Time Nanoseconds register is present only when more than one Flexible PPS
output is selected.
- Offset: 0xd84
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 TRGTBUSY0:
- PPS0 Target Time Register Busy. The MAC sets this bit when the PPSCMD0 field
in the MAC_PPS_Control register is programmed to 010 or 011. Programming the PPSCMD0 field to 010 or 011 instructs the MAC to synchronize the Target
- Time registers to the PTP clock domain. The MAC clears this bit after
synchronizing the Target Time registers to the PTP clock domain The application must not update the Target Time registers when this bit is read as 1.
- Otherwise, the synchronization of the previous programmed time gets
corrupted. 30:0 0x0 TTSL0:
- Target Time Low for PPS0 Register. This register stores the time in (signed)
nanoseconds. When the value of the timestamp matches the value in both
- Target Timestamp registers, the MAC starts or stops the PPS signal output and
generates an interrupt (if enabled) based on the TRGTMODSEL0 field (Bits [6:5]) in MAC_PPS_Control. When the TSCTRLSSR bit is set in the MAC_Timestamp_Control register, this value should not exceed 0x3B9A_C9FF.
- The actual start or stop time of the PPS signal output might have an error
margin up to one unit of sub-second increment value.
- MGBE_DWCXG_CORE_MAC_PPS0_INTERVAL_0

10G Ethernet Controller Core Registers cont'd 1 The PPS0 Interval register contains the number of units of sub-second increment value between the rising edges of PPS0 signal output (ptp_pps_o[0]).
- Offset: 0xd88
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

