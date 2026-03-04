# 31 :24 0x0 PM_SEL_15: select signal for perfmon_mux bit 15. 23:16 0x0 PM_SEL_14: select signal for perfmon_mux bit 14. 15:8 0x0 PM_SEL_13: select signal for perfmon_mux bit 13. 7:0 0x0 PM_SEL_12: select signal for perfmon_mux bit 12.

##### 7.2.2.3.2 Video Input Channel 0-10 Registers
- Channel 0 Specific Registers
- VI_CH0_CHANNEL_COMMAND_0
- HOST CHANNEL REGISTERS (non-shadowed)
- Offset: 0x4000
- Byte Offset: 0x10000
- Read/Write: R/W
- Parity Protection: See table below
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,xx00)
- Bit
- Parity Protection
- Reset
- Description
Y 0x0 WR_ACT_SEL:
- Host write operations operate on both shadow and
active register (debug)

- Video Input Channel 0-10 Registers
- Bit
- Parity Protection
- Reset
- Description
Y 0x0 RD_MUX_SEL:
- Host read operations are on non-shadowed register
(debug) Y 0x0 AUTOLOAD:
- Set to 1, if this channel should automatically load a
new configuration (as if LOAD were set) at the time that an EOF is received at the last pipeline stage that reads from configuration registers. N 0x0 LOAD:
- Atomically loads all channel state from shadow
register to active registers. Write 1 to load, Always read as 0.
- VI_CH0_CHANSEL_0
- Offset: 0x4004
- Byte Offset: 0x10010
- Read/Write: R/W
- Parity Protection: N
- Shadow: Y
- SCR Protection: 0
- Reset: 0x0000ffff (0b0000,0000,0000,0000,1111,1111,1111,1111)
- Bit
- Reset
- Description

