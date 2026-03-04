# 0 (normal operation): use AUTO_CAL_PU/PD_OFFSET as an offset to the calibration state machine setting 1 (override) : use AUTO_CAL_PU/PD_OFFSET register values directly

- Offset: 0x1e4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00010000 (0b0000,xxxx,xxxx,x001,xxx0,0000,xxx0,0000)
- PROD: 0x20000000 (0bxx1x,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- PROD
- Description
0x0 _NONE_ AUTO_CAL_START:
- Writing a one to this bit starts the calibration state
machine. This bit must be set even if the override is set in order to latch in the override value. 0x0 _NONE_ AUTO_CAL_OVERRIDE: AUTOCAL override. 0 = NORMAL :0 (normal operation): use
- AUTO_CAL_PU/PD_OFFSET as an offset
to the calibration state machine setting 1 = OVERRIDE :1 (override) : use AUTO_CAL_PU/
- PD_OFFSET register
values directly
- DISABLED
- ENABLED
AUTO_CAL_ENABLE: AUTOCAL enable. 0 = DISABLED :0 (disabled): use sdmmc2tmc_cfg* register settings for pullup/dn 1 = ENABLED :1 (normal operation): use SDMMC generated pullup/dn (override or AUTOCAL) 0x0 _NONE_ AUTO_CAL_SLW_OVERRIDE:
- AUTOCAL slew rate override

