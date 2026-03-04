# 7 :7 r/w QSPI_COMP_PAD_REG_ON i=0x0

- RW
0x0 QSPI_COMP_PAD_E_INPUT_OR_E_PWRD:
- Default value is 0 needed to start Calibration. It should be set
as 1 once calibration is done to save power. 2:2 r/w QSPI_COMP_PAD_CLK i=0x0
- RO
X
- QSPI_COMP_CALIB_STATUS
- QSPI_AUTO_CAL_CONFIG_0
- QSPICOMP pad auto-calibration settings

- QSPI Registers
- Offset: 0x1f0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00010000 (0b0000,xxxx,xxxx,x001,xxx0,0000,xxx0,0000)
- Bit
- Reset
- Description
0x0 AUTO_CAL_START:
- Writing a one to this bit starts the calibration state machine. This bit
must be set even if the override is set in order to latch in the override value. 0x0 AUTO_CAL_OVERRIDE: AUTOCAL override. 0 = NORMAL (normal operation): use AUTO_CAL_PU/PD_OFFSET as an offset to the calibration state machine setting 1 = OVERRIDE: use AUTO_CAL_PU/PD_OFFSET register values directly
- DISABLED
AUTO_CAL_ENABLE: AUTOCAL enable. 0 = DISABLED: use qspi2tmc_cfg* register settings for pullup/down 1 = ENABLED (normal operation): use QSPI generated pullup/down (override or AUTOCAL) 0x0 AUTO_CAL_SLW_OVERRIDE:
- AUTOCAL slew rate override

