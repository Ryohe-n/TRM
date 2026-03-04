# 13 :8 0x11 DQS_TRIM_VAL:

- Tap value for incoming DQS path trimmer - used in HS400 modes
0x0 DRV_LPBK_CLK_ON_CMD_LINE: Loopback trimmed clock will be driven onto cmd line, if this bit set to 1. Should be set to zero during normal data transfers. Useful in debug. 0x1 VOLTAGE_3_3_V_SUPPORT_OVERRIDE:
- Voltage support 3_3_V override
0x1 VOLTAGE_3_0_V_SUPPORT_OVERRIDE:
- Voltage support 3_0_V override
0x1 VOLTAGE_1_8_V_SUPPORT_OVERRIDE:
- Voltage support 1_8_V override
- SDMMCA_VENDOR_DEBOUNCE_COUNT_0
- Debounce Counter Value Register
- The Debounce Counter runs on 32 KHz clock. Keeping the default value to 100ms = ( 100 *
32cycles/1ms) = 3200 cycles for 100ms = 0xC80
- Offset: 0x11c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000c80 (0bxxxx,xxxx,0000,0000,0000,1100,1000,0000)
- Bit
- Reset
- Description

