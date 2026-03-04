# 537 ms period Second clock of 463 ms period (268 ms low and 195 ms high) -

- When PPSCTRL = 0011, the PPS (4 Hz) is a sequence of Three clocks of 50
percent duty cycle and 268 ms period Fourth clock of 195 ms period (134 ms low and 61 ms high) This behavior is because of the non-linear toggling of bits in the digital rollover mode in the MAC_System_Time_Nanoseconds register. or Flexible PPS Output (ptp_pps_o[0]) Control Programming these bits with a non-zero value instructs the MAC to initiate an event. When the command is transferred or synchronized to the PTP clock domain, these bits get cleared automatically. The software should ensure that these bits are programmed only when they are 'all-zero'. The following list describes the values of
- PPSCMD0: - 0000: No Command - 0001: START Single Pulse This command
generates single pulse rising at the start point defined in
- MAC_PPS0_Target_Time_Seconds and MAC_PPS0_Target_Time_Nanoseconds
register and of a duration defined in the PPS0 Width Register. - 0010: START
- Pulse Train This command generates the train of pulses rising at the start
point defined in the Target Time Registers and of a duration defined in the
- PPS0 Width Register and repeated at interval defined in the PPS Interval
- Register. By default, the PPS pulse train is free-running unless stopped by the
'Stop Pulse train at time' or 'Stop Pulse Train immediately' commands. - 0011:
- Cancel START This command cancels the START Single Pulse and START Pulse
- Train commands if the system time has not crossed the programmed start
time. - 0100: STOP Pulse train at time This command stops the train of pulses initiated by the START Pulse Train command (PPSCMD = 0010) after the time programmed in the Target Time registers elapses. - 0101: STOP Pulse Train immediately This command immediately stops the train of pulses initiated by the START Pulse Train command (PPSCMD = 0010). - 110: Cancel STOP Pulse train This command cancels the STOP pulse train at time command if the programmed stop time has not elapsed. The PPS pulse train becomes free- running on the successful execution of this command. - 0111-1111: Reserved or Presentation Time Control When MCGREN0 is 1, these bits are treated as
- Presentation time control bits. The following list describes the values of
- PPSCMD0: - 0000: MCGR operation is not carried out. If set to this value in the
mid of clock recovery or generation, all the processing inputs are flushed - 0001: Capture the Presentation time at the rising edge of mcg_pst_trig_i[0] into the MAC_PPS0_Target_Time_Seconds register - 0010: Capture the
- Presentation time at the falling edge of mcg_pst_trig_i[0] into the
- MAC_PPS0_Target_Time_Seconds register - 0011: Capture the Presentation
time at both edges of mcg_pst_trig_i[0] into the MAC_PPS0_Target_Time_Seconds register - 0100-1000: Reserved - 1001:
- Toggle output on compare - 1010: Pulse output low on compare for one PTP-
clock cycle - 1011: Pulse output high on compare for one PTP-clock cycle - 1100-1111: Reserved
- EQOS_EQOS_MAC_MAC_PPS0_TARGET_TIME_SECONDS_0

1G Ethernet Controller Core Registers The PPS Target Time Seconds register, along with PPS Target Time Nanoseconds register, is used to schedule an interrupt event [Bit 1 of MAC_Timestamp_Status] when the system time exceeds the value programmed in these registers.
- Offset: 0xb80
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

