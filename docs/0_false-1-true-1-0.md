# 0 = FALSE 1 = TRUE 1:0

- NONE
SC_STATE:
- Indicates whether PMC is in SC7 or SC8 or neither - This corresponds to
soc_wake_req being 1 (NONE) or 0 (in sc7/sc8 depending on settings) 0 = NONE 1 = SC7 2 = SC8
- PMC_IMPL_SC8_FSM_INIT_0
- Offset: 0x1c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

- PMC IMPL Registers
- SCR Protection: PMC_IMPL_SCR_SC78_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 FSM_INIT:
- SW uses this to initialize the FSM when SC8 exit is complete. Cleared by
- HW when FSM gets to IDLE

