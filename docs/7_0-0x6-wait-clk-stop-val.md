# 7 :0 0x6 WAIT_CLK_STOP_VAL:

- WAIT_CLK_STOP_VAL+1 Number of pmc_clk (32K) cycles to stay in wait
- CLK_STOP state
- PMC_IMPL_ASYNC_RST_SC7_CONFIG_0
- Offset: 0x8c0
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_ASYNC_RST_SC7_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- UNMASKED
SW_SC7_DIS:
- When set, triggering L0/L1A async reset due to power_bad from
- VrefRO is masked/disabled. 1 - Masked, 0 - Unmasked

