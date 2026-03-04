# 0 = DISABLE 1 = ENABLE 4:0 0xb FMON_OVERFLOW_BIT_SEL_OSCnFUSE_CK:

- Select HS counter bits to generate overflow error
- PMC_IMPL_FMON_DBG_CONFIG_0
- Offset: 0x8a0
- Read/Write: R/W
- Parity Protection: See table below

- PMC IMPL Registers
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_FMON_COM_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,0000,xxxx,xxx0)
- Bit
- Parity Protection
- Reset
- Description
N 0x0 FMON_FAULT_SET2HSM_PMC_CK: self clear, write 1 to set 32khz clk critical error to
- HSM
N 0x0 FMON_FAULT_CLEAR2HSM_PMC_CK: self clear, write 1 to clear 32khz clk critical error to HSM N 0x0 FMON_FAULT_SET2HSM_OSCNFUSE_CK: self clear, write 1 to set OSC clk critical error to
- HSM
N 0x0 FMON_FAULT_CLEAR2HSM_OSCNFUSE_CK: self clear, write 1 to clear OSC clk critical error to
- HSM
Y
- DISABLE
USE_OSC_STABLE_IN_FOSC_FMON_ENABLE: write 1 to use early_osc_stable from SC7 in
- FMON OSC instance enable

