# 30 :24 0x20 REQD_DELAY_STEPS_TX:

- Delay required in steps of 1/64UI - 0 to 63 steps
- MST DLL is half cycle locked - UI=0.5cycle=64steps
Default value is quarter cycle.
- Calibrated code covers oneUI of mst DLL. This reg field value is used
to scale the delay code before sending it to TX slv DLL. 22:16 0x20 REQD_DELAY_STEPS_RX:
- Delay required in steps of 1/64UI - 0 to 63 steps
- MST DLL is half cycle locked - UI=0.5cycle=64steps
Default value is quarter cycle.
- Calibrated code covers oneUI of mst DLL. This reg field value is used
to scale the delay code before sending it to RX slv DLL. 15:11 0x10 MST_DLL_RESET_TIME:
- Master DLL reset duration - 16cycles

