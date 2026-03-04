# 6 :0 0x0 GPIO_INTERRUPT_STATUS: This field has as many bits as the number of GPIO Pins in the given GPIO Port, with each such bit indicating whether the corresponding GPIO Input change has resulted in Interrupt.

- Bit 0 is for Pin 0,
- Bit 1 is for Pin 1,
... Bit <j> is for Pin <j>. 0 = Interrupt not set. 1 = Interrupt set.
- It is effective only when
((GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == ENABLE) && (GPIO_<i>_ENABLE_ CONFIG_0<j>_0.INTERRUPT_FUNCTION == ENABLE)).
- The bit in this field is cleared based on GPIO_<i>/
<iii>_INTERRUPT_CLEAR_0<j>_0.GPIO_INTERRUPT_CLEAR. In a Virtualized environment, the status reflects only the GPIOs belonging to VM. For the GPIO bit positions not mapped to VM, the corresponding bit in this field is written with "0" by hardware for software to read this register correctly.
- GPIO_R_INTERRUPT_STATUS_G0_0
- Offset: 0x12900
- GPIO_R_INTERRUPT_STATUS_G1_0
- Offset: 0x12904
- GPIO_R_INTERRUPT_STATUS_G2_0
- Offset: 0x12908
- GPIO_R_INTERRUPT_STATUS_G3_0
- Offset: 0x1290c
- GPIO_R_INTERRUPT_STATUS_G4_0
- Offset: 0x12910
- GPIO_R_INTERRUPT_STATUS_G5_0
- Offset: 0x12914
- GPIO_R_INTERRUPT_STATUS_G6_0
- Offset: 0x12918
- GPIO_R_INTERRUPT_STATUS_G7_0
- Offset: 0x1291c
- GPIO_J_INTERRUPT_STATUS_G0_0
- Offset: 0x15100

- GPIO Control Registers
- GPIO_J_INTERRUPT_STATUS_G1_0
- Offset: 0x15104
- GPIO_J_INTERRUPT_STATUS_G2_0
- Offset: 0x15108
- GPIO_J_INTERRUPT_STATUS_G3_0
- Offset: 0x1510c
- GPIO_J_INTERRUPT_STATUS_G4_0
- Offset: 0x15110
- GPIO_J_INTERRUPT_STATUS_G5_0
- Offset: 0x15114
- GPIO_J_INTERRUPT_STATUS_G6_0
- Offset: 0x15118
- GPIO_J_INTERRUPT_STATUS_G7_0
- Offset: 0x1511c
- GPIO_F_INTERRUPT_STATUS_G0_0
- Offset: 0x15900
- GPIO_F_INTERRUPT_STATUS_G1_0
- Offset: 0x15904
- GPIO_F_INTERRUPT_STATUS_G2_0
- Offset: 0x15908
- GPIO_F_INTERRUPT_STATUS_G3_0
- Offset: 0x1590c
- GPIO_F_INTERRUPT_STATUS_G4_0
- Offset: 0x15910
- GPIO_F_INTERRUPT_STATUS_G5_0
- Offset: 0x15914
- GPIO_F_INTERRUPT_STATUS_G6_0
- Offset: 0x15918
- GPIO_F_INTERRUPT_STATUS_G7_0
- Offset: 0x1591c
- Read/Write: RO
- Parity Protection: N
- Shadow: N

- GPIO Control Registers
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Rese
t
- Description

