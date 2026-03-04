# 23 :0 0x0 LOWER_THRESHOLD:

- For ERR_CONFIG=MONITOR_PERIOD - The threshold value has to be
programmed in micro-seconds units
- For ERR_CONFIG=MONITOR_PULSES - The threshold value has to be
programmed in terms of number of pulses
- TACH_FAN_TACH_INTERRUPT_ENABLE_0
- Offset: 0x10
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
0x0 COUNTER_OVERFLOW:
- When enabled, an interrupt is asserted when OVERFLOW bit is set. By default
the interrupt functionality is disabled and should be enabled by Software. 0 = DISABLE 1 = ENABLE 0x0 UNDERRUN:
- When enabled, an interrupt is asserted when UNDERRUN status is set. By
default the interrupt functionality is disabled and should be enabled by Software after programming the lower threshold. 0 = DISABLE 1 = ENABLE 0x0 OVERRUN:
- When enabled, an interrupt is asserted when OVERRUN status is set. By
default the interrupt functionality is disabled and should be enabled by Software after programming the upper threshold. 0 = DISABLE 1 = ENABLE
- TACH_FAN_TACH_CONTROL_0
- Offset: 0x14
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

- Fan Tachometer Registers
- SCR Protection: 0
- Reset: 0xffffff00 (0b1111,1111,1111,1111,1111,1111,xxxx,x000)
- Bit
- Reset
- Description

