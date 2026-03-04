# 9 :0 0xc8 ITC_FREQ_VAL:

- Internal Timer Clock Frequency Value (ITCFVAL)
- CQE timer base clock is sdmmc_clk only. This register field is updated
by VENDOR_CLOCK_CNTRL_BASE_CLK_FREQ.
- VENDOR_CLOCK_CNTRL_BASE_CLK_FREQ should be updated by SoC
specific driver with sdmmc_clk frequency selected.
- ITCFMUL and ITCFVAL indicate the frequency of the clock used for
interrupt coalescing timer and for determining the polling period when using periodic SEND_QUEUE_ STATUS (CMD13) polling. The clock frequency is calculated as ITCFVAL* ITCFMUL.
- For example, to encode 19.2 MHz, ITCFVAL shall be C0h (= 192
decimal) and ITCFMUL shall be 2h (0.1 MHz): 192 * 0.1 MHz = 19.2 MHz.
- SDMMCAB_CQE_CQCFG_0
- Command Queuing Configuration
This register controls CQE behavior affecting the general operation of command queueing module or operation of multiple tasks in the same time.
- Offset: 0xf008
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxx0,xxx0,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 DCMD_EN:
- Direct Command (DCMD) Enable
- This bit indicates to the hardware whether the Task Descriptor in slot-31 of
the TDL is a Data Transfer Task Descriptor, or a Direct Command Task Descriptor.
- CQE uses this bit when a task is issued in slot-31, to determine how to
decode the Task Descriptor.
- Bit Value Description

