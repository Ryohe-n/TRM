# 12 :0 X COUNT:

- Number of XHS to count before assert XHS timer interrupt
- VI_SYNCGEN2_CONTROL_0
- Offset: 0x3408
- Byte Offset: 0xd020
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00010000 (0bxxxx,xxxx,xxxx,xxx1,xxxx,xxx0,xxxx,xxx0)
- Bit
- Reset
- Description
0x1 CLAMP_SYNC_TO_0: 0: no clamping, XVS/XHS is as being driven, high as inactive, low as active. 1: clamp XVS/XHS to low level (default) 0x0 INSTANT_STOP: 0: disable (default) 1: instant stops timing generation if ENABLE is written as 0 0x0 ENABLE:
- When INSTANT_STOP == 0, writing ENABLE as 0 does not necessarily stop
timing generation immediately. XHS shall be still generated until end of frame is reached.
- When INSTANT_STOP == 1, writing ENABLE as 0 stops timing generation
immediately. 0 = DISABLE 1 = ENABLE
- VI_SYNCGEN2_COMMAND_0
- Offset: 0x3409
- Byte Offset: 0xd024
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,xx00)

- Video Input Registers
- Bit
- Reset
- Description
0x0 WR_ACT_SEL: 0: hosts write shadow registers (default) 1: host writes both shadow and active registers. Debug use only. 0x0 RD_MUX_SEL: 0: host reads active registers (default) 1: host reads shadow registers. Debug use only. 0x0 AUTOLOAD: 0: no auto load 1: automatically load a new configuration (as if LOAD were set) at the time that reaching end of current frame 0x0 LOAD: 0: no op 1: immediate load active register from shadow. LOAD is deferred to the end of the frame, if a frame is active. Always read as 0.
- VI_SYNCGEN2_STATUS_0
- Offset: 0x340a
- Byte Offset: 0xd028
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 PENDING_FORCED_XVS:
- Read as 1 when there is a forced XVS pending on XHS counting. 0
otherwise. 0x0 SCANNING: Read as 1 when timing generator is operative. 0 otherwise.
- VI_SYNCGEN2_SCAN_STATUS_0
- Offset: 0x340b
- Byte Offset: 0xd02c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxx0,0000,0000,0000,xxx0,0000,0000,0000)

- Video Input Registers
- Bit
- Reset
- Description

