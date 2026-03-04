# 0 = DONE 1 = PENDING

- PMC_IMPL_PART_AUD_POWER_GATE_CONTROL_0
- Offset: 0x208
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AUD_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AUD_POWER_GATE_STATUS_0
- Offset: 0x20c
- Read/Write: RO
- Parity Protection: N
- Shadow: N

- PMC IMPL Registers
- SCR Protection: PMC_IMPL_SCR_PG_AUD_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_AUD_CLAMP_CONTROL_0
- Offset: 0x210
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AUD_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_DISP_POWER_GATE_CONTROL_0
- Offset: 0x220
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_DISP_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_DISP_POWER_GATE_STATUS_0
- Offset: 0x224
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_DISP_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_DISP_CLAMP_CONTROL_0
- Offset: 0x228
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_DISP_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON

- PMC IMPL Registers
- PMC_IMPL_PART_VIC_POWER_GATE_CONTROL_0
- Offset: 0x298
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_VIC_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_VIC_POWER_GATE_STATUS_0
- Offset: 0x29c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_VIC_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON

- PMC IMPL Registers
- PMC_IMPL_PART_VIC_CLAMP_CONTROL_0
- Offset: 0x2a0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_VIC_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_XUSBA_POWER_GATE_CONTROL_0
- Offset: 0x2a4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_XUSBA_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_XUSBA_POWER_GATE_STATUS_0
- Offset: 0x2a8
- Read/Write: RO

- PMC IMPL Registers
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_XUSBA_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_XUSBA_CLAMP_CONTROL_0
- Offset: 0x2ac
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_XUSBA_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_XUSBB_POWER_GATE_CONTROL_0
- Offset: 0x2b0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_XUSBB_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_XUSBB_POWER_GATE_STATUS_0
- Offset: 0x2b4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_XUSBB_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_XUSBB_CLAMP_CONTROL_0
- Offset: 0x2b8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_XUSBB_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)

- PMC IMPL Registers
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_XUSBC_POWER_GATE_CONTROL_0
- Offset: 0x2bc
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_XUSBC_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_XUSBC_POWER_GATE_STATUS_0
- Offset: 0x2c0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_XUSBC_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON

- PMC IMPL Registers
- Bit
- Reset
- Description
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_XUSBC_CLAMP_CONTROL_0
- Offset: 0x2c4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_XUSBC_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_SCRATCH_POWER_GATE_CONTROL_0
- Offset: 0x2c8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_SCRATCH_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RW
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RO
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_SCRATCH_POWER_GATE_STATUS_0
- Offset: 0x2cc
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_SCRATCH_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_SCRATCH_CLAMP_CONTROL_0
- Offset: 0x2d0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_SCRATCH_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AONPG_POWER_GATE_CONTROL_0
- Offset: 0x2d4
- Read/Write: See table below
- Parity Protection: N

- PMC IMPL Registers
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AONPG_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RW
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RO
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AONPG_POWER_GATE_STATUS_0
- Offset: 0x2d8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AONPG_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_AONPG_CLAMP_CONTROL_0
- Offset: 0x2dc
- Read/Write: RO
- Parity Protection: N

- PMC IMPL Registers
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AONPG_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM0_POWER_GATE_CONTROL_0
- Offset: 0x388
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM0_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RW
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RO
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM0_POWER_GATE_STATUS_0
- Offset: 0x38c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM0_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)

- PMC IMPL Registers
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM0_CLAMP_CONTROL_0
- Offset: 0x390
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM0_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM1_POWER_GATE_CONTROL_0
- Offset: 0x394
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM1_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RW
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RO
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM1_POWER_GATE_STATUS_0
- Offset: 0x398
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM1_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM1_CLAMP_CONTROL_0
- Offset: 0x39c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM1_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM2_POWER_GATE_CONTROL_0

- PMC IMPL Registers
- Offset: 0x3a0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM2_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RW
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RO
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM2_POWER_GATE_STATUS_0
- Offset: 0x3a4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM2_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM2_CLAMP_CONTROL_0

- PMC IMPL Registers
- Offset: 0x3a8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM2_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM3_POWER_GATE_CONTROL_0
- Offset: 0x3ac
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM3_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RW
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RO
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM3_POWER_GATE_STATUS_0
- Offset: 0x3b0
- Read/Write: RO
- Parity Protection: N
- Shadow: N

- PMC IMPL Registers
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM3_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM3_CLAMP_CONTROL_0
- Offset: 0x3b4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM3_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM4_POWER_GATE_CONTROL_0
- Offset: 0x3b8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM4_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RW
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RW
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RO
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM4_POWER_GATE_STATUS_0
- Offset: 0x3bc
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM4_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM4_CLAMP_CONTROL_0
- Offset: 0x3c0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM4_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON

- PMC IMPL Registers
- PMC_IMPL_PART_AOPG_TCM5_POWER_GATE_CONTROL_0
- Offset: 0x3c4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM5_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RW
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RO
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM5_POWER_GATE_STATUS_0
- Offset: 0x3c8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM5_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON

- PMC IMPL Registers
- PMC_IMPL_PART_AOPG_TCM5_CLAMP_CONTROL_0
- Offset: 0x3cc
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM5_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM6_POWER_GATE_CONTROL_0
- Offset: 0x3d0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM6_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RW
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RO
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM6_POWER_GATE_STATUS_0
- Offset: 0x3d4
- Read/Write: RO

- PMC IMPL Registers
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM6_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM6_CLAMP_CONTROL_0
- Offset: 0x3d8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM6_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM7_POWER_GATE_CONTROL_0
- Offset: 0x3dc
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM7_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RW
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RO
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM7_POWER_GATE_STATUS_0
- Offset: 0x3e0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM7_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_TCM7_CLAMP_CONTROL_0
- Offset: 0x3e4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_TCM7_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)

- PMC IMPL Registers
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_CACHE_POWER_GATE_CONTROL_0
- Offset: 0x3e8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_CACHE_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RW
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RO
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_CACHE_POWER_GATE_STATUS_0
- Offset: 0x3ec
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_CACHE_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON

- PMC IMPL Registers
- Bit
- Reset
- Description
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_CACHE_CLAMP_CONTROL_0
- Offset: 0x3f0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_CACHE_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_CAN0_POWER_GATE_CONTROL_0
- Offset: 0x3f4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_CAN0_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RW
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RO
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_CAN0_POWER_GATE_STATUS_0
- Offset: 0x3f8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_CAN0_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_CAN0_CLAMP_CONTROL_0
- Offset: 0x3fc
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_CAN0_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_CAN1_POWER_GATE_CONTROL_0
- Offset: 0x400
- Read/Write: See table below
- Parity Protection: N

- PMC IMPL Registers
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_CAN1_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RW
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RO
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_CAN1_POWER_GATE_STATUS_0
- Offset: 0x404
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_CAN1_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_AOPG_CAN1_CLAMP_CONTROL_0
- Offset: 0x408
- Read/Write: RO
- Parity Protection: N

- PMC IMPL Registers
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AOPG_CAN1_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_MSS_SCRATCH_POWER_GATE_CONTROL_0
- Offset: 0x418
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MSS_SCRATCH_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RW
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RO
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_MSS_SCRATCH_POWER_GATE_STATUS_0
- Offset: 0x41c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MSS_SCRATCH_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)

- PMC IMPL Registers
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_MSS_SCRATCH_CLAMP_CONTROL_0
- Offset: 0x420
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MSS_SCRATCH_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX8A_POWER_GATE_CONTROL_0
- Offset: 0x424
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX8A_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX8A_POWER_GATE_STATUS_0
- Offset: 0x428
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX8A_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX8A_CLAMP_CONTROL_0
- Offset: 0x42c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX8A_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX4A_POWER_GATE_CONTROL_0

- PMC IMPL Registers
- Offset: 0x430
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4A_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX4A_POWER_GATE_STATUS_0
- Offset: 0x434
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4A_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX4A_CLAMP_CONTROL_0

- PMC IMPL Registers
- Offset: 0x438
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4A_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX1A_POWER_GATE_CONTROL_0
- Offset: 0x43c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX1A_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX1A_POWER_GATE_STATUS_0
- Offset: 0x440
- Read/Write: RO
- Parity Protection: N
- Shadow: N

- PMC IMPL Registers
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX1A_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX1A_CLAMP_CONTROL_0
- Offset: 0x444
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX1A_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX8B_POWER_GATE_CONTROL_0
- Offset: 0x454
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX8B_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX8B_POWER_GATE_STATUS_0
- Offset: 0x458
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX8B_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX8B_CLAMP_CONTROL_0
- Offset: 0x45c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX8B_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON

- PMC IMPL Registers
- PMC_IMPL_PART_DLAA_POWER_GATE_CONTROL_0
- Offset: 0x478
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_DLAA_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_DLAA_POWER_GATE_STATUS_0
- Offset: 0x47c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_DLAA_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON

- PMC IMPL Registers
- PMC_IMPL_PART_DLAA_CLAMP_CONTROL_0
- Offset: 0x480
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_DLAA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_DLAB_POWER_GATE_CONTROL_0
- Offset: 0x484
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_DLAB_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_DLAB_POWER_GATE_STATUS_0
- Offset: 0x488
- Read/Write: RO

- PMC IMPL Registers
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_DLAB_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_DLAB_CLAMP_CONTROL_0
- Offset: 0x48c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_DLAB_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_ISP_POWER_GATE_CONTROL_0
- Offset: 0x4c0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_ISP_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_ISP_POWER_GATE_STATUS_0
- Offset: 0x4c4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_ISP_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_ISP_CLAMP_CONTROL_0
- Offset: 0x4c8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_ISP_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)

- PMC IMPL Registers
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_NVDEC_POWER_GATE_CONTROL_0
- Offset: 0x4cc
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVDEC_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_NVDEC_POWER_GATE_STATUS_0
- Offset: 0x4d0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVDEC_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON

- PMC IMPL Registers
- Bit
- Reset
- Description
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_NVDEC_CLAMP_CONTROL_0
- Offset: 0x4d4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVDEC_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_NVJPGA_POWER_GATE_CONTROL_0
- Offset: 0x4d8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVJPGA_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_NVJPGA_POWER_GATE_STATUS_0
- Offset: 0x4dc
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVJPGA_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_NVJPGA_CLAMP_CONTROL_0
- Offset: 0x4e0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVJPGA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_NVJPGB_POWER_GATE_CONTROL_0
- Offset: 0x4e4
- Read/Write: See table below
- Parity Protection: N

- PMC IMPL Registers
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVJPGB_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_NVJPGB_POWER_GATE_STATUS_0
- Offset: 0x4e8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVJPGB_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_NVJPGB_CLAMP_CONTROL_0
- Offset: 0x4ec
- Read/Write: R/W
- Parity Protection: N

- PMC IMPL Registers
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVJPGB_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_NVENC_POWER_GATE_CONTROL_0
- Offset: 0x4f0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVENC_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_NVENC_POWER_GATE_STATUS_0
- Offset: 0x4f4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVENC_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)

- PMC IMPL Registers
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_NVENC_CLAMP_CONTROL_0
- Offset: 0x4f8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVENC_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_VI_POWER_GATE_CONTROL_0
- Offset: 0x4fc
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_VI_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_VI_POWER_GATE_STATUS_0
- Offset: 0x500
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_VI_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_VI_CLAMP_CONTROL_0
- Offset: 0x504
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_VI_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX4BA_POWER_GATE_CONTROL_0

- PMC IMPL Registers
- Offset: 0x508
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4BA_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX4BA_POWER_GATE_STATUS_0
- Offset: 0x50c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4BA_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX4BA_CLAMP_CONTROL_0

- PMC IMPL Registers
- Offset: 0x510
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4BA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX4BB_POWER_GATE_CONTROL_0
- Offset: 0x514
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4BB_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX4BB_POWER_GATE_STATUS_0
- Offset: 0x518
- Read/Write: RO
- Parity Protection: N
- Shadow: N

- PMC IMPL Registers
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4BB_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX4BB_CLAMP_CONTROL_0
- Offset: 0x51c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4BB_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX4CA_POWER_GATE_CONTROL_0
- Offset: 0x520
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4CA_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX4CA_POWER_GATE_STATUS_0
- Offset: 0x524
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4CA_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX4CA_CLAMP_CONTROL_0
- Offset: 0x528
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4CA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON

- PMC IMPL Registers
- PMC_IMPL_PART_PCIEX4CB_POWER_GATE_CONTROL_0
- Offset: 0x52c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4CB_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX4CB_POWER_GATE_STATUS_0
- Offset: 0x530
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4CB_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON

- PMC IMPL Registers
- PMC_IMPL_PART_PCIEX4CB_CLAMP_CONTROL_0
- Offset: 0x534
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4CB_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX4CC_POWER_GATE_CONTROL_0
- Offset: 0x538
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4CC_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX4CC_POWER_GATE_STATUS_0
- Offset: 0x53c
- Read/Write: RO

- PMC IMPL Registers
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4CC_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_PCIEX4CC_CLAMP_CONTROL_0
- Offset: 0x540
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4CC_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PVA_POWER_GATE_CONTROL_0
- Offset: 0x544
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PVA_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_PVA_POWER_GATE_STATUS_0
- Offset: 0x548
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PVA_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_PVA_CLAMP_CONTROL_0
- Offset: 0x54c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PVA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)

- PMC IMPL Registers
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_OFA_POWER_GATE_CONTROL_0
- Offset: 0x550
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_OFA_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_OFA_POWER_GATE_STATUS_0
- Offset: 0x554
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_OFA_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON

- PMC IMPL Registers
- Bit
- Reset
- Description
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_OFA_CLAMP_CONTROL_0
- Offset: 0x558
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_OFA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_MGBEA_POWER_GATE_CONTROL_0
- Offset: 0x55c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEA_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_MGBEA_POWER_GATE_STATUS_0
- Offset: 0x560
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEA_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_MGBEA_CLAMP_CONTROL_0
- Offset: 0x564
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_MGBEBA_POWER_GATE_CONTROL_0
- Offset: 0x568
- Read/Write: See table below
- Parity Protection: N

- PMC IMPL Registers
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEBA_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_MGBEBA_POWER_GATE_STATUS_0
- Offset: 0x56c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEBA_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_MGBEBA_CLAMP_CONTROL_0
- Offset: 0x570
- Read/Write: R/W
- Parity Protection: N

- PMC IMPL Registers
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEBA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_MGBEBB_POWER_GATE_CONTROL_0
- Offset: 0x574
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEBB_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_MGBEBB_POWER_GATE_STATUS_0
- Offset: 0x578
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEBB_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)

- PMC IMPL Registers
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_MGBEBB_CLAMP_CONTROL_0
- Offset: 0x57c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEBB_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_MGBEBC_POWER_GATE_CONTROL_0
- Offset: 0x580
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEBC_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_MGBEBC_POWER_GATE_STATUS_0
- Offset: 0x584
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEBC_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_MGBEBC_CLAMP_CONTROL_0
- Offset: 0x588
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEBC_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_EMCAA_POWER_GATE_CONTROL_0

- PMC IMPL Registers
- Offset: 0x58c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCAA_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_EMCAA_POWER_GATE_STATUS_0
- Offset: 0x590
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCAA_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_EMCAA_CLAMP_CONTROL_0

- PMC IMPL Registers
- Offset: 0x594
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCAA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_EMCAB_POWER_GATE_CONTROL_0
- Offset: 0x598
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCAB_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_EMCAB_POWER_GATE_STATUS_0
- Offset: 0x59c
- Read/Write: RO
- Parity Protection: N
- Shadow: N

- PMC IMPL Registers
- SCR Protection: PMC_IMPL_SCR_PG_EMCAB_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_EMCAB_CLAMP_CONTROL_0
- Offset: 0x5a0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCAB_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_EMCBA_POWER_GATE_CONTROL_0
- Offset: 0x5a4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCBA_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_EMCBA_POWER_GATE_STATUS_0
- Offset: 0x5a8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCBA_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_EMCBA_CLAMP_CONTROL_0
- Offset: 0x5ac
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCBA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON

- PMC IMPL Registers
- PMC_IMPL_PART_EMCBB_POWER_GATE_CONTROL_0
- Offset: 0x5b0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCBB_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x101)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- ON
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RO
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RW
- ON
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_EMCBB_POWER_GATE_STATUS_0
- Offset: 0x5b4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCBB_SCR_0
- Reset: 0x00000005 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x101)
- Bit
- Reset
- Description
- ON
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- ON
LOGIC_SLEEP_STS: 0 = OFF 1 = ON

- PMC IMPL Registers
- PMC_IMPL_PART_EMCBB_CLAMP_CONTROL_0
- Offset: 0x5b8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCBB_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- ON
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_TZRAM_POWER_GATE_CONTROL_0
- Offset: 0x5bc
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_TZRAM_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RO
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RW
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RO
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_TZRAM_POWER_GATE_STATUS_0
- Offset: 0x5c0
- Read/Write: RO

- PMC IMPL Registers
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_TZRAM_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_TZRAM_CLAMP_CONTROL_0
- Offset: 0x5c4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_TZRAM_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_DBBRAM_POWER_GATE_CONTROL_0
- Offset: 0x5c8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_DBBRAM_SCR_0
- Reset: 0x80000000 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxx0,xxxx,x000)
- Bit
R/W
- Reset
- Description
- RW
- ENABLE
INTER_PART_DELAY_EN: 0 = DISABLE 1 = ENABLE

- PMC IMPL Registers
- Bit
R/W
- Reset
- Description
- RW
- DONE
START: 0 = DONE 1 = PENDING
- RW
- OFF
SRAM_SLEEP_EN: 0 = OFF 1 = ON
- RW
- OFF
SRAM_RET_EN: 0 = OFF 1 = ON
- RO
- OFF
LOGIC_SLEEP: 0 = OFF 1 = ON
- PMC_IMPL_PART_DBBRAM_POWER_GATE_STATUS_0
- Offset: 0x5cc
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_DBBRAM_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- OFF
SRAM_SLEEP_STS: 0 = OFF 1 = ON
- OFF
SRAM_RET_STS: 0 = OFF 1 = ON
- OFF
LOGIC_SLEEP_STS: 0 = OFF 1 = ON
- PMC_IMPL_PART_DBBRAM_CLAMP_CONTROL_0
- Offset: 0x5d0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_DBBRAM_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)

- PMC IMPL Registers
- Bit
- Reset
- Description
- OFF
CLAMP: 0 = OFF 1 = ON
- PMC_IMPL_PART_AUD_PWRDWN_REQ_CONTROL_0
- Offset: 0x5d4
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AUD_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_AUD_PWRDWN_ACK_STATUS_0
- Offset: 0x5d8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_AUD_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_DISP_PWRDWN_REQ_CONTROL_0
- Offset: 0x5dc
- Read/Write: R/W
- Parity Protection: Y

- PMC IMPL Registers
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_DISP_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_DISP_PWRDWN_ACK_STATUS_0
- Offset: 0x5e0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_DISP_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_ISP_PWRDWN_REQ_CONTROL_0
- Offset: 0x5e4
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_ISP_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP

- PMC IMPL Registers
- PMC_IMPL_PART_ISP_PWRDWN_ACK_STATUS_0
- Offset: 0x5e8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_ISP_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_NVDEC_PWRDWN_REQ_CONTROL_0
- Offset: 0x5ec
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVDEC_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_NVDEC_PWRDWN_ACK_STATUS_0
- Offset: 0x5f0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVDEC_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)

- PMC IMPL Registers
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_NVJPGA_PWRDWN_REQ_CONTROL_0
- Offset: 0x5f4
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVJPGA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_NVJPGA_PWRDWN_ACK_STATUS_0
- Offset: 0x5f8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVJPGA_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP

- PMC IMPL Registers
- PMC_IMPL_PART_NVJPGB_PWRDWN_REQ_CONTROL_0
- Offset: 0x5fc
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVJPGB_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_NVJPGB_PWRDWN_ACK_STATUS_0
- Offset: 0x600
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVJPGB_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_NVENC_PWRDWN_REQ_CONTROL_0
- Offset: 0x604
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVENC_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)

- PMC IMPL Registers
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_NVENC_PWRDWN_ACK_STATUS_0
- Offset: 0x608
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_NVENC_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_VI_PWRDWN_REQ_CONTROL_0
- Offset: 0x60c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_VI_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_VI_PWRDWN_ACK_STATUS_0
- Offset: 0x610
- Read/Write: RO
- Parity Protection: N

- PMC IMPL Registers
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_VI_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_VIC_PWRDWN_REQ_CONTROL_0
- Offset: 0x614
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_VIC_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_VIC_PWRDWN_ACK_STATUS_0
- Offset: 0x618
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_VIC_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP

- PMC IMPL Registers
- Bit
- Reset
- Description
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_XUSBA_PWRDWN_REQ_CONTROL_0
- Offset: 0x61c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_XUSBA_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- PWRUP
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_XUSBA_PWRDWN_ACK_STATUS_0
- Offset: 0x620
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_XUSBA_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- PWRUP
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRUP
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRUP
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_XUSBB_PWRDWN_REQ_CONTROL_0
- Offset: 0x624
- Read/Write: R/W
- Parity Protection: Y

- PMC IMPL Registers
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_XUSBB_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- PWRUP
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_XUSBB_PWRDWN_ACK_STATUS_0
- Offset: 0x628
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_XUSBB_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- PWRUP
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRUP
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRUP
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_XUSBC_PWRDWN_REQ_CONTROL_0
- Offset: 0x62c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_XUSBC_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- PWRUP
REQ: 1 = PWRDWN 0 = PWRUP

- PMC IMPL Registers
- PMC_IMPL_PART_XUSBC_PWRDWN_ACK_STATUS_0
- Offset: 0x630
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_XUSBC_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- PWRUP
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRUP
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRUP
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_PCIEX8A_PWRDWN_REQ_CONTROL_0
- Offset: 0x634
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX8A_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_PCIEX8A_PWRDWN_ACK_STATUS_0
- Offset: 0x638
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX8A_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)

- PMC IMPL Registers
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_PCIEX4A_PWRDWN_REQ_CONTROL_0
- Offset: 0x63c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4A_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_PCIEX4A_PWRDWN_ACK_STATUS_0
- Offset: 0x640
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4A_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP

- PMC IMPL Registers
- PMC_IMPL_PART_PCIEX4BA_PWRDWN_REQ_CONTROL_0
- Offset: 0x644
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4BA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_PCIEX4BA_PWRDWN_ACK_STATUS_0
- Offset: 0x648
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4BA_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_PCIEX4BB_PWRDWN_REQ_CONTROL_0
- Offset: 0x64c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4BB_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)

- PMC IMPL Registers
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_PCIEX4BB_PWRDWN_ACK_STATUS_0
- Offset: 0x650
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4BB_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_PCIEX4CA_PWRDWN_REQ_CONTROL_0
- Offset: 0x654
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4CA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_PCIEX4CA_PWRDWN_ACK_STATUS_0
- Offset: 0x658
- Read/Write: RO
- Parity Protection: N

- PMC IMPL Registers
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4CA_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_PCIEX4CB_PWRDWN_REQ_CONTROL_0
- Offset: 0x65c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4CB_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_PCIEX4CB_PWRDWN_ACK_STATUS_0
- Offset: 0x660
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4CB_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP

- PMC IMPL Registers
- Bit
- Reset
- Description
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_PCIEX4CC_PWRDWN_REQ_CONTROL_0
- Offset: 0x664
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4CC_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_PCIEX4CC_PWRDWN_ACK_STATUS_0
- Offset: 0x668
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX4CC_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_PCIEX1A_PWRDWN_REQ_CONTROL_0
- Offset: 0x66c
- Read/Write: R/W
- Parity Protection: Y

- PMC IMPL Registers
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX1A_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_PCIEX1A_PWRDWN_ACK_STATUS_0
- Offset: 0x670
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX1A_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_PCIEX8B_PWRDWN_REQ_CONTROL_0
- Offset: 0x674
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX8B_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP

- PMC IMPL Registers
- PMC_IMPL_PART_PCIEX8B_PWRDWN_ACK_STATUS_0
- Offset: 0x678
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PCIEX8B_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_PVA_PWRDWN_REQ_CONTROL_0
- Offset: 0x67c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PVA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_PVA_PWRDWN_ACK_STATUS_0
- Offset: 0x680
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_PVA_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)

- PMC IMPL Registers
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_DLAA_PWRDWN_REQ_CONTROL_0
- Offset: 0x684
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_DLAA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_DLAA_PWRDWN_ACK_STATUS_0
- Offset: 0x688
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_DLAA_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP

- PMC IMPL Registers
- PMC_IMPL_PART_DLAB_PWRDWN_REQ_CONTROL_0
- Offset: 0x68c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_DLAB_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_DLAB_PWRDWN_ACK_STATUS_0
- Offset: 0x690
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_DLAB_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_OFA_PWRDWN_REQ_CONTROL_0
- Offset: 0x694
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_OFA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)

- PMC IMPL Registers
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_OFA_PWRDWN_ACK_STATUS_0
- Offset: 0x698
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_OFA_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_MGBEA_PWRDWN_REQ_CONTROL_0
- Offset: 0x69c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_MGBEA_PWRDWN_ACK_STATUS_0
- Offset: 0x6a0
- Read/Write: RO
- Parity Protection: N

- PMC IMPL Registers
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEA_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_MGBEBA_PWRDWN_REQ_CONTROL_0
- Offset: 0x6a4
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEBA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_MGBEBA_PWRDWN_ACK_STATUS_0
- Offset: 0x6a8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEBA_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP

- PMC IMPL Registers
- Bit
- Reset
- Description
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_MGBEBB_PWRDWN_REQ_CONTROL_0
- Offset: 0x6ac
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEBB_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_MGBEBB_PWRDWN_ACK_STATUS_0
- Offset: 0x6b0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEBB_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_MGBEBC_PWRDWN_REQ_CONTROL_0
- Offset: 0x6b4
- Read/Write: R/W
- Parity Protection: Y

- PMC IMPL Registers
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEBC_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_MGBEBC_PWRDWN_ACK_STATUS_0
- Offset: 0x6b8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_MGBEBC_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_EMCAA_PWRDWN_REQ_CONTROL_0
- Offset: 0x6bc
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCAA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP

- PMC IMPL Registers
- PMC_IMPL_PART_EMCAA_PWRDWN_ACK_STATUS_0
- Offset: 0x6c0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCAA_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_EMCAB_PWRDWN_REQ_CONTROL_0
- Offset: 0x6c4
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCAB_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_EMCAB_PWRDWN_ACK_STATUS_0
- Offset: 0x6c8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCAB_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)

- PMC IMPL Registers
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_EMCBA_PWRDWN_REQ_CONTROL_0
- Offset: 0x6cc
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCBA_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_EMCBA_PWRDWN_ACK_STATUS_0
- Offset: 0x6d0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCBA_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP

- PMC IMPL Registers
- PMC_IMPL_PART_EMCBB_PWRDWN_REQ_CONTROL_0
- Offset: 0x6d4
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCBB_SCR_0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- PWRDWN
REQ: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_PART_EMCBB_PWRDWN_ACK_STATUS_0
- Offset: 0x6d8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PG_EMCBB_SCR_0
- Reset: 0x00000007 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111)
- Bit
- Reset
- Description
- PWRDWN
H1X_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
DBB_ACK: 1 = PWRDWN 0 = PWRUP
- PWRDWN
CBB_ACK: 1 = PWRDWN 0 = PWRUP
- PMC_IMPL_SW_OVERRIDE_CTRL_1_0
The status in POWER_GATE_STATUS does not reflect the overridden values.
- Offset: 0x6dc
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

- PMC IMPL Registers
- SCR Protection: PMC_IMPL_SCR_PG_OVERRIDE_SCR_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
- DISABLE
EN_AOPG_TCM7:
- Override enable for AOPG RAM control signal

