# 7 :0 0x0 STARTCOUNT:

- If restart (i.e., start while WDT is already enabled) is attempted and
windowing operation is enabled and current expiration level == StartLevel, restart is rejected if current downcounter > (Period - StartCount).
- StartCount is the number of cycles where rejection takes place at the start
of that level.
- RTC2_CLK_OVR_ON_0
- Offset: 0x118
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: RTC2_SCR_RTCSCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 RTC:
- SLCG override bit

