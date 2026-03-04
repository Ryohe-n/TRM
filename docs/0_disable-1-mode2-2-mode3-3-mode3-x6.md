# 0 = DISABLE 1 = MODE2 2 = MODE3 3 = MODE3_X6


- Video Input Registers
- Bit
R/W
- Parity Protection
- Reset
- Description
- RW
N 0x0 FRAMEIDGEN:
- Insert a sequential frame ID on each
incoming frame, discard CSI frame ID field.
- RW
N 0x0 STICKYFAULT:
- Some form of fault on the line has occurred if
bit reads high
- RO
N X VPR:
- VPR mode for DEINTERLAVED stream, there
is at most one virtual channel
- RW
N 0x0 SRESET:
- Reset some state associated with
- EIGHT_LANE deinterleave
- RW
N 0x1 QBLOCK:
- Block traffic and reset both FIFO queues
associated with EIGHT_LANE deinterleaving when MODE!=DISABLE
- RW
N 0x0 FEINJECT:
- Manually Force a Frame End on
stream stream is in a frame (always issue during a Q_RESET) when MODE!=DISABLE
- RW
N 0x0 FESHORTTIMER: If 0 FE_MAX_TIME is in steps 2^20 VI cycles.
- If 1 then steps of 2^8 cycles (sims or error
inject) 19:4
- RW
N 0x0 FEMAXTIME:
- Force a frame end after a frame start when
- FE_MAX_TIME*2^20 clock cycles have
elapsed, off if ==0 3:0
- RW
N 0x0 WT:
- The weight of deint stream into arbiter
- VI_CSIMUX_EIGHT_LANE_DEINT_NOTIFY_MASK_0
- Offset: 0x1108
- Byte Offset: 0x4420
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

