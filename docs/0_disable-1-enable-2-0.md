# 0 = DISABLE 1 = ENABLE 2:0

- DISABLE
FMON_LOAD_DATA_SEL_OSCnFUSE_CK:
- Select value to load
0x1 - Min 0x2 - Max 0x3 - Count [0] (latest Count) 0x4 - Count [1] 0x5 - Count [2] 0x6 - Count [3] 0x7 - Count [4] (Earliest count) 0 = DISABLE 1 = ENABLE
- PMC_IMPL_FMON_LOAD_DATA_STATUS_0_OSCnFUSE_CK_0
- Offset: 0x888
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_OSCnFUSE_CK_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- DISABLE
FMON_LOAD_DATA_DONE_OSCnFUSE_CK:
- Status : Load data done

