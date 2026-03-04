# 1 = JTAG_IN_USE 0 = JTAG_NOT_IN_USE

- CORESIGHT_CFG_DEBUG_ACK_QUAL_0
- CoreSight Debug Acknowledge Qualification Register
- When the corresponding bit is set, the corresponding DBGACK in CORESIGHT_CFG_DEBUG_ACK_0
participates in the timer freeze else the effect of that DBGACK is ignored.
- Offset: 0x20020
- Read/Write: R/W
- Parity Protection: N
- Reset: 0x00000000 (0bxxx0,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
- - 0x0 DBGACK_DCE:
- Debug Acknowledge qualifier for DCE

