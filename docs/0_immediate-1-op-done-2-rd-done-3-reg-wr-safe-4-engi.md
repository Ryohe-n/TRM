# 0 = IMMEDIATE 1 = OP_DONE 2 = RD_DONE 3 = REG_WR_SAFE 4 = ENGINE_IDLE 5 = COND_5 6 = COND_6 7 = COND_7 8 = COND_8 9 = COND_9 10 = COND_10 11 = COND_11 12 = COND_12 13 = COND_13 14 = COND_14 15 = COND_15 16 = COND_16 17 = COND_17 18 = COND_18 19 = COND_19 20 = COND_20 21 = COND_21 22 = COND_22 23 = COND_23 24 = COND_24 25 = COND_25 26 = COND_26 27 = COND_27 28 = COND_28 29 = COND_29 30 = COND_30 31 = COND_31 9:0 0x0 VI_INDX:

- Syncpt index value
- VI_CFG_VI_INCR_SYNCPT_CNTRL_0
- Offset: 0x1001
- Byte Offset: 0x4004
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,xxx0)

- Video Input Registers
- Bit
- Reset
- Description
0x0 VI_INCR_SYNCPT_NO_STALL:
- If NO_STALL is 1, then when fifos are full,
- INCR_SYNCPT methods will be dropped and the
INCR_SYNCPT_ERROR[COND] bit will be set.
- If NO_STALL is 0, then when fifos are full,
the client host interface will be stalled. 0x0 VI_INCR_SYNCPT_SOFT_RESET:
- If SOFT_RESET is set, then all internal state
of the client syncpt block will be reset.
- To do soft reset, first set SOFT_RESET of
all Host Controller clients affected, then clear all SOFT_RESETs.
- VI_CFG_VI_INCR_SYNCPT_ERROR_0
- Offset: 0x1002
- Byte Offset: 0x4008
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xXXXXXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

