# 1 :0 0x0 ADSP_STALL_SEL: 0 = DISABLED 1 = INSTR_STALL 2 = DATA_STALL 3 = INSTR_DATA_STALL

- AMISC_ACTMON_REQ_THRSHOLD_0
This is an array of 3 identical register entries; the register fields below apply to each entry. Full register list is: AMISC_ACTMON_REQ_THRSHOLD_<i>, where <i> = 0, 1, 2.
- Offset: 0x124,..,0x12c
- Read/Write: R/W
- Parity Protection: N
- Reset: 0x0000000f (0bxxxx,xxxx,xxxx,xxxx,xxxx,0000,x000,1111)
- Bit
- Reset
- Description
0x0 REQ_THRSHLD_ADAST_RD_EN: 0 = DISABLE 1 = ENABLE 0x0 REQ_THRSHLD_ADAST_WR_EN: 0 = DISABLE 1 = ENABLE 0x0 REQ_THRSHLD_ACAST_WR_EN: 0 = DISABLE 1 = ENABLE 0x0 REQ_THRSHLD_ACAST_RD_EN: 0 = DISABLE 1 = ENABLE 6:0 0xf
- REQ_THRSHLD_LEVEL
- AMISC_ACTMON_MEM_ACTIVITY_PULSE_N_0
This is an array of 3 identical register entries; the register fields below apply to each entry. Full register list is: AMISC_ACTMON_MEM_ACTIVITY_PULSE_N_<i>, where <i> = 0, 1, 2.
- Offset: 0x130,..,0x138
- Read/Write: R/W

- Audio Generic Interrupt Control (AGIC) Registers
- Parity Protection: N
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxx0,x000,0000)
- Bit
- Reset
- Description
0x0 ENABLE: 0 = DISABLE 1 = ENABLE 6:0 0x0
- PULSE_N
- AMISC_ACTMON_COMMON_ADSP_PULSE_N_0
- Offset: 0x13c
- Read/Write: R/W
- Parity Protection: N
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxx0,0000,0000)
- Bit
- Reset
- Description
0x0 ENABLE: 0 = DISABLE 1 = ENABLE 7:0 0x0
- PULSE_N
- AMISC_ACTMON_COMMON_REQ_THRSHOLD_PULSE_N_0
- Offset: 0x140
- Read/Write: R/W
- Parity Protection: N
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxx0,x000,0000)
- Bit
- Reset
- Description
0x0 ENABLE: 0 = DISABLE 1 = ENABLE 6:0 0x0
- PULSE_N
#### 7.7.4.22 Audio Generic Interrupt Control (AGIC) Registers
- AGIC_DISTRIBUTOR_GICD_CTLR_0
- Offset: 0x1000
- Read/Write: RW

- Audio Generic Interrupt Control (AGIC) Registers
- Parity Protection: N
- Reset: 0xXXXXXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

