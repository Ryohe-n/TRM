# 29 :0 0x0 TARGET:

- Target value of the selected reference counter, i.e., when value of the
selected reference equals target value, the interrupt is generated. The difference between TARGET and the current value must be positive when interpreting TARGET and the 29
- LSB of the selected
reference counter as signed integers, otherwise the interrupt triggers immediately.
- TKE_TOP_WDT0_WDTCR_0
- WDTCR{w} BW + P*{w} + 0 RW Watchdog Timer Configuration Register
- WDTSR{w} BW + P*{w} + 4 RO Watchdog Timer Status Register
- WDTCMDR{w} BW + P*{w} + 8 WO Watchdog Timer Command Register
- WDTUR{w} BW + P*{w} + 12 RW Watchdog Timer Unlock Register
- Watchdog Timer Configuration Register
- Offset: 0x110000
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: TKE_TOP_SCR_WDTSCR0_0
- Reset: 0x00700000 (0b0000,xx00,0111,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

