# 17 :10 0x0 COND: 0 = IMMEDIATE 1 = OP_DONE 2 = RD_DONE 3 = REG_WR_SAFE 4 = ENGINE_IDLE 9:0 0x0 INDX: 0 = INIT

- NV_PVIC_THI_INCR_SYNCPT_CTRL_0
- Offset: 0x4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

- VIC Registers
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xx00,0000,0000,xxxx,xxx0,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 NO_STALL_4: 0 = INIT 0x0 SOFT_RESET_4: 0 = INIT 0x0 NO_STALL_3: 0 = INIT 0x0 SOFT_RESET_3: 0 = INIT 0x0 NO_STALL_2: 0 = INIT 0x0 SOFT_RESET_2: 0 = INIT 0x0 NO_STALL_1: 0 = INIT 0x0 SOFT_RESET_1: 0 = INIT 0x0 NO_STALL_0: 0 = INIT 0x0 SOFT_RESET_0: 0 = INIT 0x0 NO_STALL: 0 = INIT 0x0 SOFT_RESET: 0 = INIT
- NV_PVIC_THI_INCR_SYNCPT_ERR_0
- Offset: 0x8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0,0000)
- Bit
- Reset
- Description
0x0 COND_STS_ENGINE_IDLE: 0 = INIT 1 = CLEAR

- VIC Registers
- Bit
- Reset
- Description
0x0 COND_STS_REG_WR_SAFE: 0 = INIT 1 = CLEAR 0x0 COND_STS_RD_DONE: 0 = INIT 1 = CLEAR 0x0 COND_STS_OPDONE: 0 = INIT 1 = CLEAR 0x0 COND_STS_IMM: 0 = INIT 1 = CLEAR
- NV_PVIC_THI_CTXSW_INCR_SYNCPT_0
- Offset: 0xc
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000,0000)
- Bit
- Reset
- Description

