# 1 :0 0x0 GPIO_INTERRUPT_STATUS:

- This field has as many bits as the number of GPIO Pins in the given GPIO Port,
with each such bit indicating whether the corresponding GPIO Input change has resulted in Interrupt.
- Bit 0 is for Pin 0,
- Bit 1 is for Pin 1,
... Bit <j> is for Pin <j>. 0 = Interrupt not set. 1 = Interrupt set.
- It is effective only when
((GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == ENABLE) && (GPIO_<i>_ENABLE_ CONFIG_0<j>_0.INTERRUPT_FUNCTION == ENABLE)).
- The bit in this field is cleared based on GPIO_<i>/
<iii>_INTERRUPT_CLEAR_0<j>_0.GPIO_INTERRUPT_CLEAR.
- In a Virtualized environment, the status reflects only the GPIOs belonging to
- VM. For the GPIO bit positions not mapped to VM, the corresponding bit in this
field is written with "0" by hardware for software to read this register correctly.
- GPIO_V_INTERRUPT_STATUS_G0_0
- Offset: 0x1300

- GPIO FSI Control Registers
- GPIO_V_INTERRUPT_STATUS_G1_0
- Offset: 0x1304
- GPIO_V_INTERRUPT_STATUS_G2_0
- Offset: 0x1308
- GPIO_V_INTERRUPT_STATUS_G3_0
- Offset: 0x130c
- GPIO_V_INTERRUPT_STATUS_G4_0
- Offset: 0x1310
- GPIO_V_INTERRUPT_STATUS_G5_0
- Offset: 0x1314
- GPIO_V_INTERRUPT_STATUS_G6_0
- Offset: 0x1318
- GPIO_V_INTERRUPT_STATUS_G7_0
- Offset: 0x131c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 GPIO_INTERRUPT_STATUS:
- This field has as many bits as the number of GPIO Pins in the given GPIO Port,
with each such bit indicating whether the corresponding GPIO Input change has resulted in Interrupt.
- Bit 0 is for Pin 0,
- Bit 1 is for Pin 1,
... Bit <j> is for Pin <j>. 0 = Interrupt not set. 1 = Interrupt set.
- It is effective only when
((GPIO_<i>_ENABLE_ CONFIG_0<j>_0.GPIO_ENABLE == ENABLE) && (GPIO_<i>_ENABLE_ CONFIG_0<j>_0.INTERRUPT_FUNCTION == ENABLE)).
- The bit in this field is cleared based on GPIO_<i>/
<iii>_INTERRUPT_CLEAR_0<j>_0.GPIO_INTERRUPT_CLEAR.
- In a Virtualized environment, the status reflects only the GPIOs belonging to
- VM. For the GPIO bit positions not mapped to VM, the corresponding bit in this
field is written with "0" by hardware for software to read this register correctly.

- Activity Monitor (ACTMON)

