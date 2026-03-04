# 3 :0 0x0 GPIO_INTERRUPT_STATUS: This field has as many bits as the number of GPIO Pins in the given GPIO Port, with each such bit indicating whether the corresponding GPIO Input change has resulted in Interrupt.

- Bit 0 is for Pin 0,
- Bit 1 is for Pin 1,
... Bit <j> is for Pin <j>. 0 = Interrupt not set. 1 = Interrupt set.
- It is effective only when
((GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == ENABLE) && (GPIO_<i>_ENABLE_ CONFIG_0<j>_0.INTERRUPT_FUNCTION == ENABLE)).
- The bit in this field is cleared based on GPIO_<i>/
<iii>_INTERRUPT_CLEAR_0<j>_0.GPIO_INTERRUPT_CLEAR. In a Virtualized environment, the status reflects only the GPIOs belonging to VM. For the GPIO bit positions not mapped to VM, the corresponding bit in this field is written with "0" by hardware for software to read this register correctly.
- GPIO_DD_INTERRUPT_STATUS_G0_0
- Offset: 0x1700
- GPIO_DD_INTERRUPT_STATUS_G1_0
- Offset: 0x1704
- GPIO_DD_INTERRUPT_STATUS_G2_0
- Offset: 0x1708
- GPIO_DD_INTERRUPT_STATUS_G3_0
- Offset: 0x170c
- GPIO_DD_INTERRUPT_STATUS_G4_0
- Offset: 0x1710
- GPIO_DD_INTERRUPT_STATUS_G5_0
- Offset: 0x1714
- GPIO_DD_INTERRUPT_STATUS_G6_0
- Offset: 0x1718
- GPIO_DD_INTERRUPT_STATUS_G7_0
- Offset: 0x171c
- Read/Write: RO
- Parity Protection: N
- Shadow: N

- GPIO Control Registers
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Rese
t
- Description

