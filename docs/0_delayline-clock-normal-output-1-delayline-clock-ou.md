# 0 : Delayline clock normal output 1 : DelayLIne clock output gated and grounded to 0. should be set to 1 when SW trys to update slv dll delay code should be cleared after slave dll settle time - 3cycles

- RW
0x0 MST_DLL_PWRDN_OVERRIDE_EN:
- When set, master dll can be kept in power down mode by
programming MST_DLL_PWRDN field.
- Else pwrdn is controlled by DLL controller
- RW
0x0 MST_DLL_PWRDN:
- Master DLL power down enable - active high control - used
when MST_DLL_PWRDN_OVERRIDE_EN is set 0: power up ; 1 - power down
- SW can keep MST dll in power down mode once calibration is
done. MST DLL should be powered up before triggering calibration.
- Controls dll_en in iobrick

