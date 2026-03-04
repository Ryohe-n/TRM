# 31 :0 0x4000 TIMER_VALUE:

- Specifies the time period of toggling the SOC_ERROR in terms of 1µs
pulses synchronous to sce_apb_clk.
- Applicable when FSI_HSM_SOC_ERROR_OPERATION_MODE is set to
TOGGLE. Should be programmed with the value which is: 1) Less than FTTI 2) Greater than FSI_HSM_SOC_ERROR_CLR_PULSE_WIDTH
- Actual value of the timer can be fixed based on platform MCU or other
related circuit's. sensing granularity. The sampling context explained in
- FSI_HSM_SOC_ERROR_CLR_PULSE_WIDTH register is applicable here
also.
- The timer operates with regard to 1 MHz pulse. SOC_ERROR Toggle
toggles at every (Value +1) cycles of this pulse.
- FSI_HSM_HSM_SOC_ERROR_OUT_STATUS_0
- Offset: 0x30
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
0x1 SOC_ERROR_OUT:
- HSM SOC_ERROR output status. 1 if HSM SOC_ERROR output is
asserted, 0 otherwise.
- FSI_HSM_HP_INT_STATUS_0
This is an array of 32 identical register entries; the register fields below apply to each entry. Full register list is: FSI_HSM_HP_INT_STATUS_<i>, among which <i> belongs to <0..31>.
- Offset: 0x100,..,0x17c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

- HSM Registers
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

