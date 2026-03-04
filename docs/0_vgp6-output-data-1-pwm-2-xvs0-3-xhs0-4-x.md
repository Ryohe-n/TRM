# 0 = VGP6_OUTPUT_DATA 1 = PWM 2 = XVS0 3 = XHS0 4 = XVS1 5 = XHS1 6 = XVS2 7 = XHS2

- RW
0x0 VGP6_OUTPUT_ENABLE:
- VGP6 pin Output Enable
This bit controls VGP6 pin output. 0= Disabled 1= Enabled 0 = DISABLED 1 = ENABLED

- Video Input Registers
- Bit
R/W
- Reset
- Description
- RO
X VGP6_INPUT_DATA:
- VGP6 pin Input Data
(effective if VGP6_INPUT_ENABLE is ENABLED) 0= VGP6 input low 1= VGP6 input high
- RW
X VGP6_OUTPUT_DATA:
- VGP6 pin Output Data
(effective if VGP6_OUTPUT_ENABLE is ENABLED and VGP6_OUTPUT_SELECT is DATA)
- VI_CFG_INTERRUPT_TYPE_SELECT_0
- Interrupt Type Select
- Offset: 0x1020
- Byte Offset: 0x4080
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000,000x)
- Bit
- Reset
- Description
0x0 VGP6_INT_TYPE:
- VGP6 pin Interrupt Type
- This bit controls interrupt VGP6

