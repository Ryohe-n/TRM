# 29 :20 0x1 SDCLK_FREQ_SEL_SDR50:

- System software programs 10-bit divider value to generate SD clk in
- SDR50 mode (<100MHz,1.8Vsignaling)
- This value is readable in the standard via
- PRESET_SDR50_AND_SDR25_0_SDCLK_FREQ_VAL_HIGH register
field
- Default val is 0x1 (gives 2N divider) assuming 208MHz base clock

