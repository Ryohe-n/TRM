# 0 = DISABLE 1 = ENABLE 0x0 DFD_CLAMP_OVERRIDE: used for overriding the clamp of all the inputs for DFD partition.


- PMC IMPL Registers
- Bit
- Reset
- Description
0x0 DBGRST_OVR: used for overriding the reset going out to debug module in SC7
- OFF
RESET_DEBUG: used for debug, assertion of reset will be disabled, if this bit is set 0 = OFF 1 = ON
- OFF
DPD_ENABLE_DEBUG: used for debug, assertion of SEL_DPD and E_DPD to pads will be disabled if this bit is set 0 = OFF 1 = ON
- OFF
MAIN_CLAMP_DEBUG: used for debug, assertion of soc2aon main and early clamp will be disabled if this bit is set 0 = OFF 1 = ON 1:0
- NONE
- Reserved
- PMC_IMPL_PWRGOOD_TIMER_0
Power Good Timer Programs length of wakeup reset, asserted after wakeup from lp0. The register should be set before entering lp0 mode. Programmed values depends on properties of power management unit. Timer value x 30.51 us = reset pulse length Increased the width of PWRGOOD timer to 16 bits.
- Offset: 0x2c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PWRGOOD_TIMER_SCR_0
- Reset: 0x3f00007f (0b0011,1111,0000,0000,0000,0000,0111,1111)
- Bit
- Reset
- Description

