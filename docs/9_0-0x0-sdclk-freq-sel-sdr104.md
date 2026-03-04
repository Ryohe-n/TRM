# 9 :0 0x0 SDCLK_FREQ_SEL_SDR104:

- System software programs 10-bit divider value to generate SD clk in
- SDR104 mode (<208MHz,1.8Vsignaling)
- This value is readable in the standard via
- PRESET_DDR50_AND_SDR104_0_SDCLK_FREQ_VAL_LOW register
field
- SDMMCA_SDMEMCOMPPADCTRL_0
- SDMEMCOMP Pad control register
This register is used to control COMP pad inputs.

- SDMMCA Registers
- Offset: 0x1e0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x08000000 (0b00x0,1xx0,0000,xxx0,0000,0000,0000,0000)
- PROD: 0x00007000 (0bxxxx,xxxx,xxxx,xxx0,0111,xxxx,xxxx,xxxx)
- Bit
- Reset
- PROD
- Description
0x0 _NONE_ PAD_E_INPUT_OR_E_PWRD: used to control E_INPUT(for SDMMC1/3) and E_PWRD (for SDMMC4) input of pu/pd comp pad should be set at least 1usec before starting auto-cal and cleared once auto-calibration is done (for power saving)
- NOTE: E_PWRD = !PAD_E_INPUT_OR_E_PWRD and
E_INPUT = PAD_E_INPUT_OR_E_PWRD 0x0 _NONE_ COMP_PAD_E_PBIAS_BUF:
- Active high. Enables internally generated bias levels for
driver PMOS.
- We dont use this feature for SDMMC pads. SW *should
not* set this bit. Keeping reg for debug purpose. 28:27 0x1 _NONE_ COMP_PAD_DRV_TYPE: used to control drv_type input of BDSDMEMLVCOMP_C pad 24:20 0x0 _NONE_ COMP_PAD_DRVUP_OVR: used to drive DRVUP input of COMP pad if
- AUTO_CAL_ENABLE is disabled

