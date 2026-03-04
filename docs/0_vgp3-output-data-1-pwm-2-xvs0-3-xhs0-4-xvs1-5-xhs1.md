# 0 = VGP3_OUTPUT_DATA 1 = PWM 2 = XVS0 3 = XHS0 4 = XVS1 5 = XHS1 6 = XVS2 7 = XHS2

- RW
0x0 VGP3_OUTPUT_ENABLE:
- VGP3 pin Output Enable
This bit controls VGP3 pin output. 0= Disabled 1= Enabled 0 = DISABLED 1 = ENABLED

- Video Input Registers
- Bit
R/W
- Reset
- Description
- RO
X VGP3_INPUT_DATA:
- VGP3 pin Input Data
(effective if VGP3_INPUT_ENABLE is ENABLED) 0= VGP3 input low 1= VGP3 input high
- RW
X VGP3_OUTPUT_DATA:
- VGP3 pin Output Data
(effective if VGP3_OUTPUT_ENABLE is ENABLED and VGP3_OUTPUT_SELECT is DATA)
- VI_CFG_VGP4_0
- VI VGP4 input/output config/data
- Offset: 0x101d
- Byte Offset: 0x4074
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
0x0 VGP4_INPUT_ENABLE:
- VGP4 pin Input Enable
- This bit is unused

