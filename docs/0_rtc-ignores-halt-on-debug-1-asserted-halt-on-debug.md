# 0 RTC ignores Halt-on-debug. 1 Asserted Halt-on-debug signal halts RTC 0 = ON 1 = OFF

- RTC2_RTCBR_0
- RTC Busy Register

- Real-Time Clock Registers
- Offset: 0x4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: RTC2_SCR_RTCSCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 STATUS:
- When 1, this bit indicates that a write is being transferred to the 32,768Hz
clock domain. It is set when a write targeting a register in the 32,768Hz clock domain is received on the APB interface and is cleared when the write is fully transferred to the 32,768Hz clock domain. 0 = FREE 1 = BUSY
- RTC2_RTCSCR_0
- RTC Second Counter Register
- Offset: 0x8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: RTC2_SCR_CNTSCR_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

