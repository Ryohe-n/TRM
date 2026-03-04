# 9 :0 0x0 VALUE:

- Interrupt is triggered when the milliseconds counter matches the value in
this register.
- RTC2_RTCSCAR_0
- RTC Second Countdown Alarm Register
- Offset: 0x20
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: RTC2_SCR_RTCSCR_0
- Reset: 0x40000000 (0b0100,0000,0000,0000,0000,0000,0000,0000)

- Real-Time Clock Registers
- Bit
- Reset
- Description
0x0 EN: Enable, when set, enables the countdown process. 0x1 PER:
- Periodic, when set, the internal counter is automatically reloaded after
reaching 0 29:0 0x0 PTV:
- Timer Present Trigger Value, when enabled, an internal counter is
loaded with this field and counted down for every second until it reaches 0. If enabled, an interrupt is then triggered when the count reaches zero.
- RTC2_RTCMCAR_0
- RTC Millisecond Countdown Alarm Register
- Offset: 0x24
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: RTC2_SCR_RTCSCR_0
- Reset: 0x40000000 (0b0100,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 EN: Enable, when set, enables the countdown process. 0x1 PER:
- Periodic, when set, the internal counter is automatically reloaded after
reaching 0 29:0 0x0 PTV:
- Timer Present Trigger Value, when enabled, an internal counter is
loaded with this field and counted down for every second until it reaches 0. If enabled, an interrupt is then triggered when the count reaches zero.
- RTC2_RTCIER_0
- RTC Interrupt Enable Register
- Offset: 0x28
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N

- Real-Time Clock Registers
- SCR Protection: RTC2_SCR_RTCSCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0,0000)
- Bit
- Reset
- Description
0x0 MSEC_CDN_ALARM:
- Enable bit for interrupt associated with the millisecond countdown
alarm 0x0 SEC_CDN_ALARM:
- Enable bit for interrupt associated with the second countdown alarm
0x0 MSEC_ALARM:
- Enable bit for interrupt associated with the milliseconds alarm

