# 11 :8 0x5 SAMPLE_COUNT:

- SAMPLE_COUNT is the number of times the phase detector is
sampled before going onto the next set of trimmer values. The number of samples is (2 ^ SAMPLE_COUNT) 7:0 0x4 SAMPLE_DELAY:
- SAMPLE_DELAY is the number of sdmmc host clks from changing the
trimmer value to when the phase detector is sampled.
- SDMMCAB_VENDOR_DLL_CTRL0_0
- Vendor DLL control register0
This register has SW overrides for controlling both master and slave DLL inputs.
- Offset: 0x1b4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x60000000 (0b0110,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 MST_DLL_CLK_EN_OVERRIDE:
- Master DLL CLK_IN enable override

