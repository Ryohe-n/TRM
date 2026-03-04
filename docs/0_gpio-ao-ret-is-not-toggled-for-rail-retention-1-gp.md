# 0 -> GPIO_AO_RET is not toggled for rail retention. 1 -> GPIO_AO_RET is toggled to support rail retention 0 = DISABLE 1 = ENABLE 7:0 0x0 RAIL_RET_EXIT_DELAY:

- Delay in 32KHz clocks (RAIL_RET_EXIT_DELAY cycles of CLK_32K),
specifying the VDD_AO regulator ramp from retention to functional level.
- Timer can be disabled by programming a value of 0 to RAIL
- RET_EXIT_DELAY
- PMC_IMPL_SC7_DEBUG_CTRL_0
- Offset: 0x28
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_SC7_DEBUG_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxx0,0000,0000)
- Bit
- Reset
- Description
- DISABLE
GLITCH_FREE_CLKEN: when this is set, clken signal gets de-asserted before reset assertion and gets asserted after reset assertion 0 = DISABLE 1 = ENABLE
- DISABLE
DBG_SLEEP_SKIP: when this bit set(ENABLED), PG SLEEP sequence is not triggered for
- SC7 entry

