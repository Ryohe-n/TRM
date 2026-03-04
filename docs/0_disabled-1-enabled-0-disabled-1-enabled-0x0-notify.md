# 0 = Disabled 1 = Enabled 0 = DISABLED 1 = ENABLED 0x0 NOTIFY_FIFO_OVFL_ERR_MASK:

- Interrupt Mask for Notify FIFO Overflow
- This bit enable generation of VI Interrupt when Notify FIFO overflow is
asserted 0 = Disabled 1 = Enabled 0 = DISABLED 1 = ENABLED 0x0 NOTIFY_TIMESTAMP_OVFL_ERR_MASK: 0 = Disabled 1 = Enabled 0 = DISABLED 1 = ENABLED
- VI_CFG_PWM_CONTROL_0
- VI Pulse Width Modulation Control
PWM signal generation logic can generate up to 128 pulses per line internally and the PWM pulse select registers determines which of the 128 pulses will be output. Any of the 128 internally generated pulse can be independently selected as output if they occur within one line time. PWM

- Video Input Registers
signal can be output on the VGP6 pin if VGP6 output is enabled and the output select is set to PWM. The PWM will be triggered by the first vsync after the PWM_ENABLE bit has been set.
- Offset: 0x100f
- Byte Offset: 0x403c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,xx00,xxxx,xxxx,xxxx,xxx0,xxx0)
- Bit
- Reset
- Description

