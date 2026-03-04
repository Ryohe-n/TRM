# 0 = DISABLE 1 = ENABLE Y 0x0 OSC_CTRL_SELECT: select whether CAR's OSC_CTRL or PMC's

- OSC_CTRL_OVER affects the oscillator cell. This bit
should always be "1" in LP0. 0 = CAR 1 = PMC 21:20 Y 0x0 XO_LP0_MODE: control the behavior of the oscillator during LP0 (assuming OSC_CTRL_SELECT is set to PMC during LP0, put oscillator in DPD mode during LP0, bypass DPD, but do not enable oscillator during LP0, force the oscillator to run during LP0, run the oscillator when requested by an external clock request pin 0 = DPD 1 = OFF 2 = ON 3 = EXT_REQ 19:12 Y 0x0 OSCFI_SPARE: Crystal oscillator spare register control. 11:7 Y 0x0 XODS: Crystal oscillator duty cycle control. 6:1 Y 0x1 XOFS: Crystal oscillator drive strength control.

- PMC IMPL Registers
- Bit
- Parity Protection
- Reset
- Description
N 0x0
- Reserved
- PMC_IMPL_CLK_OUT_CNTRL_0
- Offset: 0x64
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_CNTRL_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

