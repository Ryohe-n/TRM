# 0 = VREF_775_MV 1 = VREF_800_MV 2 = VREF_825_MV 3 = VREF_850_MV 0x1 SEL_VREG: By default, BG is disabled to save power if interface is not used. Software should select BG for error free QSPI operation.

- PROD value: 0x0
- **Software should set this to 0x0 before accessing QSPI. This
setting makes IB trimmer delay independent of VDD_CORE*** 0: Selects regulated reference voltage for trimmer supply - default (recommended option for tunable QSPI modes) 1: Selects VAUXC for trimmer supply and shut down BG+REG circuit (can be used in non-Tunable modes for power saving) Power up time for BG+REG is ~3µs (worst case). Power down time for BG+REG is ~1µs (worst case).
- If Software wants to turn on/off BG+REG when QSPI is idle, it has to
take hit of 3µs power on time. 0x0 SEL_VREF:
- Select reference voltage for voltage regulator

