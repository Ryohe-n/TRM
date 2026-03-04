# 1 :0 0x0 GPIO_INTERRUPT_STATUS: This field has as many bits as the number of GPIO Pins in the given GPIO Port, with each such bit indicating whether the corresponding GPIO Input change has resulted in Interrupt.

- Bit 0 is for Pin 0,
- Bit 1 is for Pin 1,
... Bit <j> is for Pin <j>. 0 = Interrupt not set. 1 = Interrupt set.
- It is effective only when
((GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == ENABLE) && (GPIO_<i>_ENABLE_ CONFIG_0<j>_0.INTERRUPT_FUNCTION == ENABLE)).
- The bit in this field is cleared based on GPIO_<i>/
<iii>_INTERRUPT_CLEAR_0<j>_0.GPIO_INTERRUPT_CLEAR. In a Virtualized environment, the status reflects only the GPIOs belonging to VM. For the GPIO bit positions not mapped to VM, the corresponding bit in this field is written with "0" by hardware for software to read this register correctly.
- GPIO_B_INTERRUPT_STATUS_G0_0
- Offset: 0x10700
- GPIO_B_INTERRUPT_STATUS_G1_0
- Offset: 0x10704
- GPIO_B_INTERRUPT_STATUS_G2_0
- Offset: 0x10708
- GPIO_B_INTERRUPT_STATUS_G3_0
- Offset: 0x1070c
- GPIO_B_INTERRUPT_STATUS_G4_0
- Offset: 0x10710
- GPIO_B_INTERRUPT_STATUS_G5_0
- Offset: 0x10714
- GPIO_B_INTERRUPT_STATUS_G6_0
- Offset: 0x10718
- GPIO_B_INTERRUPT_STATUS_G7_0
- Offset: 0x1071c
- GPIO_GG_INTERRUPT_STATUS_G0_0
- Offset: 0x1300

- GPIO FSI Common Control Registers
- GPIO_GG_INTERRUPT_STATUS_G1_0
- Offset: 0x1304
- GPIO_GG_INTERRUPT_STATUS_G2_0
- Offset: 0x1308
- GPIO_GG_INTERRUPT_STATUS_G3_0
- Offset: 0x130c
- GPIO_GG_INTERRUPT_STATUS_G4_0
- Offset: 0x1310
- GPIO_GG_INTERRUPT_STATUS_G5_0
- Offset: 0x1314
- GPIO_GG_INTERRUPT_STATUS_G6_0
- Offset: 0x1318
- GPIO_GG_INTERRUPT_STATUS_G7_0
- Offset: 0x131c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bi
t
- Rese
t
- Description
0x0 GPIO_INTERRUPT_STATUS: This field has as many bits as the number of GPIO Pins in the given GPIO Port, with each such bit indicating whether the corresponding GPIO Input change has resulted in Interrupt.
- Bit 0 is for Pin 0,
- Bit 1 is for Pin 1,
... Bit <j> is for Pin <j>. 0 = Interrupt not set. 1 = Interrupt set.
- It is effective only when
((GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == ENABLE) && (GPIO_<i>_ENABLE_ CONFIG_0<j>_0.INTERRUPT_FUNCTION == ENABLE)).
- The bit in this field is cleared based on GPIO_<i>/
<iii>_INTERRUPT_CLEAR_0<j>_0.GPIO_INTERRUPT_CLEAR. In a Virtualized environment, the status reflects only the GPIOs belonging to VM. For the GPIO bit positions not mapped to VM, the corresponding bit in this field is written with "0" by hardware for software to read this register correctly.
#### 9.5.6.3 GPIO FSI Common Control Registers
NOTE:

- GPIO FSI Common Control Registers
- All GPIO_S, GPIO_T, and GPIO_W Common Control Registers share the same base address
under the name FSI_GPIO_CLT0.
- All GPIO_U and GPIO_V Common Control Registers share the same base address under the
name FSI_GPIO_CLT1.
- For the base address of FSI GPIO Controller 0 Common Control Registers (FSI_GPIO_CLT0) and
- FSI GPIO Controller 1 Common Control Registers (FSI_GPIO_CLT1), please refer to the System
Address Map in this TRM. NOTE:
- The binary “x” is turned to “0” for the Reset and PROD hex value. Hence, in some cases, a
mismatch occurs between the displayed hexadecimal and binary value. A bit Reset value as “x” or “Undefined” actually means that the bit could be either “0” or “1” after Reset, whereas a bit PROD value as “x” or “Don’t-care” means that either “0” or “1” can be written to the bit by software Initialization.
- GPIO_FSI<m>_ICG_EN_OVERRIDE_0,
where <m> = 0, 1.
- GPIO_FSI0_ICG_EN_OVERRIDE_0
- Offset: 0x810
- GPIO_FSI1_ICG_EN_OVERRIDE_0
- Offset: 0x810
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: GPIO_FSI<m>_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 GPIO_ICG_EN_OVERRIDE: This field enables ICG Override. 0 = ICG Override Disabled. 1 = ICG Override Enabled.
- GPIO_<iii>_INT<jjj>_ROUTE_MAPPING_0,
where <iii> = S, T, W, U, V and <jjj> = 0, 1, 2, 3, 4, 5, 6, 7.

- GPIO FSI Common Control Registers
- GPIO_S_INT0_ROUTE_MAPPING_0
- Offset: 0x814
- GPIO_S_INT1_ROUTE_MAPPING_0
- Offset: 0x818
- GPIO_S_INT2_ROUTE_MAPPING_0
- Offset: 0x81c
- GPIO_S_INT3_ROUTE_MAPPING_0
- Offset: 0x820
- GPIO_S_INT4_ROUTE_MAPPING_0
- Offset: 0x824
- GPIO_S_INT5_ROUTE_MAPPING_0
- Offset: 0x828
- GPIO_S_INT6_ROUTE_MAPPING_0
- Offset: 0x82c
- GPIO_S_INT7_ROUTE_MAPPING_0
- Offset: 0x830
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: GPIO_FSI0_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description

