# 9 :0 0x0 SDCLK_FREQ_SEL_INIT:

- System software programs 10-bit divider value to generate desired SD
clk frequency during initialization
- This value is readable in the standard via
- PRESET_DEFAULT_AND_INIT_0_SDCLK_FREQ_VAL_LOW register field
- For Eg., if 400KHz SDCLK is desired @base clk freq=48MHz, this
register should be programmed with 0x3C
- SDMMCA_VENDOR_PRESET_VAL1_0
- Offset: 0x1d8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00100804 (0bxx00,0000,0001,0000,0000,1000,0000,0100)

- SDMMCA Registers
- Bit
- Reset
- Description

