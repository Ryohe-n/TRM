# 31 :0 0x0 FMON_LOAD_DATA_VAL_PMC_CK:

- Return data value
- PMC_IMPL_FMON_CLEAR_COUNTER_PMC_CK_0

- PMC IMPL Registers
- Offset: 0x858
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PMC_CK_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
- Reset
- Description
0x0 FMON_HOLD_COUNT_SAMPLES_PMC_CK:
- When set, the Min, Max, Count[4:0] sampling is stopped
0x0 FMON_CLEAR_FMON_COUNTER_PMC_CK: S/W clear for FMON counter. S/W is expected to write 1 to clear counter (and then write 0). 0x0 FMON_MASK_MIN_MAX_COUNT_CLEAR_PMC_CK:
- When set, min max counter values are not cleared when we assert
fmon_clear_fmon_counter 0x0 FMON_MIN_MAX_LASTN_COUNT_CLEAR_PMC_CK:
- Clear Min, Max, Count[4:0] samples
- PMC_IMPL_FMON_DEBUG_CONFIG_PMC_CK_0
- Offset: 0x85c
- Read/Write: See table below
- Parity Protection: See table below
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PMC_CK_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
R/W
- Parity Protection
- Reset
- Description
- RO
N 0x0 FMON_REF_WINDOW_PMC_CK:
- Status : Read reference window
- RW
Y
- DISABLE
FMON_ENABLE_DEBUG_PMC_CK:
- Enable debug. Enables clock divider and
gates output to DFD logic when not enabled 0 = DISABLE 1 = ENABLE
- PMC_IMPL_FMON_CNTR_OVERFLOW_CTRL_PMC_CK_0
- Offset: 0x860
- Read/Write: R/W
- Parity Protection: Y

- PMC IMPL Registers
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PMC_CK_SCR_0
- Reset: 0x8000000c (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0,1100)
- Bit
- Reset
- Description
- ENABLE
USE_CNTR_OVERFLOW_DC_FAULT_PMC_CK:
- Use the bit to select overflow error as DC fault for reset req generation

