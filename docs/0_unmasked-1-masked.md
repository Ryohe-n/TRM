# 0 = UNMASKED 1 = MASKED

- PMC_IMPL_PMC_RESET_DETECTOR_0
- Offset: 0x8c4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
- DETECTED
pmc2dfd_reset_detector: if read 1, reset cycling happened after power cycling. if read 0, reset cycling has not happened after power cycling 1 = DETECTED 0 = NOT_DETECTED
- PMC_IMPL_LED_BREATHING_CTRL_0

- PMC IMPL Registers
- LED Breathing
- Offset: 0x8c8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_CNTRL_SCR_0
- Reset: 0x00000002 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx10)
- Bit
- Reset
- Description
0x1 SHORT_LOW_PERIOD_EN:
- Enable short low period between 2 cones
0x0 BREATHING_EN:
- Enable the LED breathing functionality
- PMC_IMPL_LED_BREATHING_COUNTER0_0
- Offset: 0x8cc
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_CNTRL_SCR_0
- Reset: 0x00000004 (0b0000,0000,0000,0000,0000,0000,0000,0100)
- Bit
- Reset
- Description

