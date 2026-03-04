# 0 = VGP1_OUTPUT_DATA 1 = PWM 2 = XVS0 3 = XHS0 4 = XVS1 5 = XHS1 6 = XVS2 7 = XHS2

- RW
0x0 VGP1_OUTPUT_ENABLE:
- VGP1 pin Output Enable
This bit controls VGP1 pin output. 0= Disabled 1= Enabled 0 = DISABLED 1 = ENABLED

- Video Input Registers
- Bit
R/W
- Reset
- Description
- RO
X VGP1_INPUT_DATA:
- VGP1 pin Input Data
(effective if VGP1_INPUT_ENABLE is ENABLED) 0= VGP1 input low 1= VGP1 input high
- RW
X VGP1_OUTPUT_DATA:
- VGP1 pin Output Data
(effective if VGP1_OUTPUT_ENABLE is ENABLED and VGP1_OUTPUT_SELECT is DATA)
- VI_CFG_VGP2_0
- VI VGP2 input/output config/data
- Offset: 0x101b
- Byte Offset: 0x406c
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
0x0 VGP2_INPUT_ENABLE:
- VGP2 pin Input Enable
- This bit is unused

