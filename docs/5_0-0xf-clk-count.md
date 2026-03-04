# 5 :0 0xf CLK_COUNT:

- Before gating second level clocks controller will wait for these many
cycles. we can recover if any idle windows are missed in clken equation
- SDMMCA_VENDOR_PRESET_VAL0_0
- Vendor Preset Value Registers
SD host spec defines one preset value register for each bus speed mode which should be set by host by some unique method. Preset values vary based on the base frequency used which is in SW (SoC system driver) control.
- System driver supposed to set BASE_CLK_FREQ in VENDOR_CLOCK_CNTRL register before
handling over the control to SD host standard driver. In the similar way, system driver should set below vendor preset values based on the base clock

- SDMMCA Registers
frequency and the desired card clock frequency in each bus speed mode This should be done after every time SDMMC is reset and after every soft reset.
- This is important as all SDMMC controllers follow the same register map, but could
be programmed with different frequencies depending on the use case. Default values are set assuming base clock frequency=208 MHz.
- Offset: 0x1d4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00201000 (0bxx00,0000,0010,0000,0001,0000,0000,0000)
- Bit
- Reset
- Description

