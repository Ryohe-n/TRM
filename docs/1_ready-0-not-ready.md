# 1 Ready 0 Not Ready

- INTERNAL_CLOCK_EN - Internal Clock Enable
- This bit is set to 0 when the Host Driver is not using the Host Controller or the
- Host Controller awaits a wakeup interrupt. The Host Controller should stop its
internal clock to go very low power state. Still, registers shall be able to be read and written. Clock starts to oscillate when this bit is set to 1. When clock oscillation is stable, the Host Controller shall set Internal Clock Stable in this register to 1. This bit shall not affect card detection.
- Offset: 0x2c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,x000,xxxx,0000,0000,0000,000x,0000)
- PROD: 0x00000002 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
R/W
- Reset
- PROD
- Description
- RW
0x0 _NONE_ SW_RESET_FOR_DAT_LINE: 0 = WORK 1 = RESETED
- RW
0x0 _NONE_ SW_RESET_FOR_CMD_LINE: 0 = WORK 1 = RESETED
- RW
0x0 _NONE_ SW_RESET_FOR_ALL: 0 = WORK 1 = RESETED 19:16
- RW
0x0 _NONE_
- DATA_TIMEOUT_COUNTER_VALUE

