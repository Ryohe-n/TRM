# 16 :12 0x0 0x7 COMP_PAD_DRVDN_OVR: used to drive DRVDN input of COMP pad if

- AUTO_CAL_ENABLE is disabled
0x0 _NONE_ COMP_PAD_E_TEST_OUT: used to control e_test_out input of COMP pad 10:7 0x0 _NONE_ COMP_PAD_RFU_IN: Unused comp pad input pins. Reserved for future usage. 6:4 0x0 _NONE_ COMP_PAD_TEST_SEL: used to control test_sel input of COMP pad 3:0 0x0 _NONE_ SDMMC2TMC_CFG_SDMEMCOMP_VREF_SEL:
- Select different bias levels for driver PMOS when
E_PBIAS_BUF=1.
- We dont use this feature for SDMMC pads. SW *should
not* set this bit. Keeping reg for debug purpose.
- SDMMCA_AUTO_CAL_CONFIG_0

- SDMMCA Registers
- SDMEMCOMP pad auto-calibration settings
- AUTO_CAL_SLW_OVERRIDE

