# 1 :0 0x0 SEC_ALARM:

- Same structure as the RTC Interrupt Enable register, shows the current
status of the interrupts after the enable mask. The register is R only and returns Status & Enable.
- RTC2_RTCFIR_0
- RTC Force Interrupt Register
- Offset: 0x34
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: RTC2_SCR_RTCSCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0,0000)
- Bit
- Reset
- Description
0x0
- MSEC_CDN_ALARM
0x0
- SEC_CDN_ALARM
0x0
- MSEC_ALARM

