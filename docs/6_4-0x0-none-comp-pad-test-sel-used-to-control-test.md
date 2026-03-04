# 6 :4 0x0 _NONE_ COMP_PAD_TEST_SEL: used to control test_sel input of COMP pad 3:0 0x0 _NONE_ SDMMC2TMC_CFG_SDMEMCOMP_VREF_SEL:

- Select different bias levels for driver PMOS when
E_PBIAS_BUF=1.
- We dont use this feature for SDMMC pads. SW *should
not* set this bit. Keeping reg for debug purpose.
- SDMMCAB_AUTO_CAL_CONFIG_0
- SDMEMCOMP pad auto-calibration settings
- AUTO_CAL_SLW_OVERRIDE

