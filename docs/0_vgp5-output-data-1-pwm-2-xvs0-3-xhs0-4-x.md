# 0 = VGP5_OUTPUT_DATA 1 = PWM 2 = XVS0 3 = XHS0 4 = XVS1 5 = XHS1 6 = XVS2 7 = XHS2

- RW
0x0 VGP5_OUTPUT_ENABLE:
- VGP5 pin Output Enable
This bit controls VGP5 pin output. 0= Disabled 1= Enabled 0 = DISABLED 1 = ENABLED

- Video Input Registers
- Bit
R/W
- Reset
- Description
- RO
X VGP5_INPUT_DATA:
- VGP5 pin Input Data
(effective if VGP5_INPUT_ENABLE is ENABLED) 0= VGP5 input low 1= VGP5 input high
- RW
X VGP5_OUTPUT_DATA:
- VGP5 pin Output Data
(effective if VGP5_OUTPUT_ENABLE is ENABLED and VGP5_OUTPUT_SELECT is DATA)
- VI_CFG_VGP6_0
- VI VGP6 input/output config/data
- Offset: 0x101f
- Byte Offset: 0x407c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000X0X (0bxxxx,xxx0,xxxx,0000,xxxx,xxxx,xxxx,xxxx)
- Bit
R/W
- Reset
- Description
- RW
0x0 VGP6_INPUT_ENABLE:
- VGP6 pin Input Enable
- This bit is unused

