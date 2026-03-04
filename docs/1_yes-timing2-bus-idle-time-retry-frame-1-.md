# 1 | YES | TIMING2_BUS_IDLE_TIME_RETRY_FRAME 1 | NO | TIMING2_BUS_IDLE_TIME_RETRY_FRAME 0 | NO | TIMING2_BUS_IDLE_TIME_NEW_FRAME 0 | YES | TIMING2_BUS_IDLE_TIME_ADDITIONAL_FRAME

- If a frame is sent immediately following the previous frame, hardware waits for
"TIMING2_BUS_IDLE_TIME_ADDITIONAL_FRAME," however, if the bus is used elsewhere before that time elapses, the hardware resets its wait time counter and waits for "TIMING2_BUS_IDLE_TIME_NEW_FRAME."
- Offset: 0x10
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00010000 (0b0xxx,xxxx,xxxx,xx01,xxx0,xxx0,0000,0000)

- CEC Registers
- Bit
R/W
- Reset
- Description
- RO
- UNLOCKED
WR_LOCK:
- Gets set/locked once Tx data register is written and reset/unlocked
once the data is transferred to core clock
- Check for TX_EMPTY_INT and WR_LOCK before writing into
- TX_REGISTER

