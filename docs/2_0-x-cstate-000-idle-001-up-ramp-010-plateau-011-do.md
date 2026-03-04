# 2 :0 X CSTATE: 000 - IDLE, 001 - UP_RAMP, 010 - PLATEAU, 011 - DOWN_RAMP, 100 - SHORT_LOW_PERIOD, 101 - LONG_LOW_PERIOD.

- PMC_IMPL_DPD_AUX_CLAMP_0

- PMC IMPL Registers
- Offset: 0x8e0
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_AUX_CLAMP_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
0x1 AUX_CLAMP: 1 - UPHY clampped 0 - UPHY not clampped
- PMC_IMPL_L2_SOURCE_MASK_0
- Offset: 0x8e4
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_L2_RST_SRC_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxx0,0000,0000,0000,0000)
- Bit
- Reset
- Description
- UNMASK
FSI_R5WDT:
- MASK/UNMASK FSI_R5 L2 reset reqest to PMC

