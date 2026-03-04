# 1 :0 0x0 SEC_ALARM: Note that the semantic of the FIR is slightly different than in LIC.

- In LIC the FIR register is ORed with the incoming interrupt signals, in RTC
the force toggles the source bit itself. Also the FIR in RTC acts like the FIR SET register in LIC.
- Same structure as the RTC Interrupt Enable register. Write only register for
test purposes, forces the corresponding interrupt status bit to 1b.
- RTC2_RTCRSR_0
- RTC Reference Selection Register

- Real-Time Clock Registers
- Offset: 0x38
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: RTC2_SCR_CNTSCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,xxx1)
- Bit
- Reset
- Description

