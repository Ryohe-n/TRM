# 31 :0 0x0 FMON_LOAD_DATA_VAL_OSCnFUSE_CK:

- Return data value
- PMC_IMPL_FMON_CLEAR_COUNTER_OSCnFUSE_CK_0
- Offset: 0x894
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_OSCnFUSE_CK_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
- Reset
- Description
0x0 FMON_HOLD_COUNT_SAMPLES_OSCnFUSE_CK:
- When set, the Min, Max, Count[4:0] sampling is stopped
0x0 FMON_CLEAR_FMON_COUNTER_OSCnFUSE_CK: S/W clear for FMON counter. S/W is expected to write 1 to clear counter (and then write 0). 0x0 FMON_MASK_MIN_MAX_COUNT_CLEAR_OSCnFUSE_CK:
- When set, min max counter values are not cleared when we assert
fmon_clear_fmon_counter 0x0 FMON_MIN_MAX_LASTN_COUNT_CLEAR_OSCnFUSE_CK:
- Clear Min, Max, Count[4:0] samples

- PMC IMPL Registers
- PMC_IMPL_FMON_DEBUG_CONFIG_OSCnFUSE_CK_0
- Offset: 0x898
- Read/Write: See table below
- Parity Protection: See table below
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_OSCnFUSE_CK_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
R/W
- Parity Protection
- Reset
- Description
- RO
N 0x0 FMON_REF_WINDOW_OSCnFUSE_CK:
- Status : Read reference window
- RW
Y
- DISABLE
FMON_ENABLE_DEBUG_OSCnFUSE_CK:
- Enable debug. Enables clock divider and
gates output to DFD logic when not enabled 0 = DISABLE 1 = ENABLE
- PMC_IMPL_FMON_CNTR_OVERFLOW_CTRL_OSCnFUSE_CK_0
- Offset: 0x89c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_OSCnFUSE_CK_SCR_0
- Reset: 0x8000000b (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0,1011)
- Bit
- Reset
- Description
- ENABLE
USE_CNTR_OVERFLOW_DC_FAULT_OSCnFUSE_CK:
- Use the bit to select overflow error as DC fault for reset req generation

