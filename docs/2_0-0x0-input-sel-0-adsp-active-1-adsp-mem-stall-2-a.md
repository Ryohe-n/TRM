# 2 :0 0x0 INPUT_SEL: 0 = ADSP_ACTIVE 1 = ADSP_MEM_STALL 2 = AST_ACTIVE 5 = OUTSTANDING_REQ_THRESHOLD

- AMISC_ACTMON_MEM_ACTIVITY_0
This is an array of 3 identical register entries; the register fields below apply to each entry. Full register list is: AMISC_ACTMON_MEM_ACTIVITY_<i>, where <i> = 0, 1, 2.
- Offset: 0x10c,..,0x114
- Read/Write: R/W
- Parity Protection: N
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,0000)
- Bit
- Reset
- Description
0x0 MEM_ACT_MODE: 1 = REQUEST_COUNT 0 = TRANSFER_COUNT 0x0 ADAST_WR_ACT_EN: 0 = DISABLE 1 = ENABLE 0x0 ADAST_RD_ACT_EN: 0 = DISABLE 1 = ENABLE 0x0 ACAST_WR_ACT_EN: 0 = DISABLE 1 = ENABLE 0x0 ACAST_RD_ACT_EN: 0 = DISABLE 1 = ENABLE
- AMISC_ACTMON_ADSP_PMU_0
This is an array of 3 identical register entries; the register fields below apply to each entry. Full register list is: AMISC_ACTMON_ADSP_PMU_<i>, where <i> = 0, 1, 2.

- Audio Miscellaneous (AMISC) Control Registers
- Offset: 0x118,..,0x120
- Read/Write: R/W
- Parity Protection: N
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description

