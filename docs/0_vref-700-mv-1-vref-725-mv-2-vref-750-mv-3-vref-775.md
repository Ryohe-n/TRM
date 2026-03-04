# 0 = VREF_700_MV 1 = VREF_725_MV 2 = VREF_750_MV 3 = VREF_775_MV 4 = VREF_800_MV 5 = VREF_850_MV 6 = VREF_900_MV 7 = VREF_950_MV 7:6 0x0 TRIM_SEL_ATEST:

- For testing purpose only - should be used when sdmmc is in idle
state Select analog test signals to send to comp pad. 0x0: Not used (float) 0x1: Regulator input voltage 0x2: Regulator output voltage before analog mux 0x3: Regulator output after analog mux
- ENABLE
TRIM_PWRSAVE:
- Enables power saving mode by clock gating the unused taps in
delay chain
- Active low signal,

