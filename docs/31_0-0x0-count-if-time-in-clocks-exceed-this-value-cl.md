# 31 :0 0x0 COUNT: if time in clocks exceed this value, clear alarm counter and re-arm

- SOC_THERM_EDP_OC_INTR_STATUS_0
- Offset: 0x489c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xx00,xxxx,xxx0,0000,0x00,0000)
- Bit
- Reset
- Description
0x0 CLDVFS_DIDT_EVENT2:
- CLDVFS interrupt enable
0x0 CLDVFS_DIDT:
- CLDVFS interrupt status
0x0 OC6_DURATION:
- OC event 6 intr status
0x0 OC5_DURATION:
- OC event 5 intr status
0x0 OC4_DURATION:
- OC event 4 intr status
0x0 OC3_DURATION:
- OC event 3 intr status
0x0 OC2_DURATION:
- OC event 2 intr status
0x0 OC1_DURATION:
- OC event 1 intr status
0x0 OC6:
- OC event 6 intr status

- Thermal Registers
- Bit
- Reset
- Description
0x0 OC5:
- OC event 5 intr status
0x0 OC4:
- OC event 4 intr status
0x0 OC3:
- OC event 3 intr status
0x0 OC2:
- OC event 2 intr status
0x0 OC1:
- OC event 1 intr status
- SOC_THERM_EDP_OC_INTR_ENABLE_0
- Offset: 0x48a0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xx00,xxxx,xxx0,0000,0x00,0000)
- Bit
- Reset
- Description
0x0 CLDVFS_DIDT_EVENT2_EN:
- CLDVFS interrupt enable
0x0 CLDVFS_DIDT_EN:
- CLDVFS interrupt enable
0x0 OC6_DURATION_EN:
- OC event 6 intr status
0x0 OC5_DURATION_EN:
- OC event 5 intr status
0x0 OC4_DURATION_EN:
- OC event 4 intr status
0x0 OC3_DURATION_EN:
- OC event 3 intr status
0x0 OC2_DURATION_EN:
- OC event 2 intr status
0x0 OC1_DURATION_EN:
- OC event 1 intr status
0x0 OC6_EN:
- OC event 6 intr enable
0x0 OC5_EN:
- OC event 5 intr enable

- Thermal Registers
- Bit
- Reset
- Description
0x0 OC4_EN:
- OC event 4 intr enable
0x0 OC3_EN:
- OC event 3 intr enable
0x0 OC2_EN:
- OC event 2 intr enable
0x0 OC1_EN:
- OC event 1 intr enable
- SOC_THERM_EDP_OC_INTR_DISABLE_0
- Offset: 0x48a4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xx00,xxxx,xxx0,0000,0x00,0000)
- Bit
- Reset
- Description
0x0 CLDVFS_DIDT_EVENT2_DIS:
- CLDVFS interrupt enable
0x0 CLDVFS_DIDT_DIS:
- CLDVFS interrupt disable
0x0 OC6_DURATION_DIS:
- OC event 6 intr status
0x0 OC5_DURATION_DIS:
- OC event 5 intr status
0x0 OC4_DURATION_DIS:
- OC event 4 intr status
0x0 OC3_DURATION_DIS:
- OC event 3 intr status
0x0 OC2_DURATION_DIS:
- OC event 2 intr status
0x0 OC1_DURATION_DIS:
- OC event 1 intr status
0x0 OC6_DIS:
- OC event 6 intr enable
0x0 OC5_DIS:
- OC event 5 intr disable
0x0 OC4_DIS:
- OC event 4 intr disable

- Thermal Registers
- Bit
- Reset
- Description
0x0 OC3_DIS:
- OC event 3 intr disable
0x0 OC2_DIS:
- OC event 2 intr disable
0x0 OC1_DIS:
- OC event 1 intr disable
- SOC_THERM_EDP_OC_ALARM_OC1_STATS_0
- Offset: 0x48a8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

