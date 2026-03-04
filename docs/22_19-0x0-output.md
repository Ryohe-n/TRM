# 22 :19 0x0 OUTPUT:

- SPARE outputs
0x0 SAMPLING_COMPLETE:
- Indicates sampling is complete if 1'b1
0x0 ERROR_PHASE:
- Registers in which phase of crystal clock, attack was detected. *Only
applicable for XTAL_SCPM 1'b0 - Timing failure in low phase of clock 1'b1 - Timing failure in high phase of clock 4:1 0x0 PATH_TIMING_STATUS:
- Registers each Path timing status for debug/characterization
0x0 ERROR_OUT_STATUS:
- Registers SCPM_OUT status for debug/characterization
- PMC_IMPL_SOC_XTAL_SCPM_RO_COUNT_0

- PMC Wake Registers
- Offset: 0xfa14
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_SOC_XTAL_SCPM_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,0000,0000,0000,0000)
- Bit
- Reset
- Description

