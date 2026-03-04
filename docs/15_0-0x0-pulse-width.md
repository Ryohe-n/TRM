# 15 :0 0x0 PULSE_WIDTH:

- Specify minimum number of cycles SOC_ERROR stays in Non-erroneous state
after SOC_ERROR_CLR command is issued. SOC_ERROR stays in non- erroneous state even if there are new error interrupts until PULSE_WIDTH
- Timer Expires. Timer operates with regard to 1us pulses synchronous to
sce_apb_clk. The pulse width granularity is 1 µs. When the value is 0, that means this register has no effect.
- FSI_HSM_RSTREQ_0
- Offset: 0x20

- HSM Registers
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

