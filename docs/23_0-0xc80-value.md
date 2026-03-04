# 23 :0 0xc80 VALUE:

- The number of 32KHz clock cycles is programed to meet Debounce
period of the card slot.This register is valid for only SDMMC1.
- SDMMCA_VENDOR_MISC_CNTRL_0
- Misc Vendor Cntrl Register
- SDMMC_SPARE0: Spare register bits with reset value of 0
- SDMMC_SPARE0[0] : SW_RESET_CLKEN_OVERRIDE, override the sdmmc_clken when doing
SW_RESET if set to 1. SDMMC_SPARE0[1] : When set, allows SD clock to be stopped in the middle of a read data block while in SDR104/HS400 modes(allow_sdr104_intrablock_stalls). Unsafe for some SD/eMMC cards, but may improve SDR104 DMA read performance in some cases.

- SDMMCA Registers
- SDMMC_SPARE0[2] : When set, SDR104 support is advertised in
- SDMMC_CAPABILITIES_HIGHER_0_SDR104
- SDMMC_SPARE0[3] : When set, SDR50 support is advertised in
- SDMMC_CAPABILITIES_HIGHER_0_SDR50
- SDMMC_SPARE0[5] : When 0, masks the pad macro's "high speed" enable to 0, causing the pad
macro to always launch data on the falling edge of the clock. This prevents the SD Host driver's setting of
- SDMMC_POWER_CONTROL_HOST_x_HIGH_SPEED_EN from undesireably affecting the output
timing. SDMMC_SPARE0[7:6] : Number of pipe stages.
- SDMMC_SPARE0[8] : When set, DDR50 support is advertised in
SDMMC_CAPABILITIES_HIGHER_0_DDR50.
- SDMMC_SPARE1: Spare register bits with reset value of 1
- SDMMC_SPARE1[0] : Reserved
- SDMMC_SPARE1[1] : Reserved
- Offset: 0x120
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xffff0098 (0b1111,1111,1111,1111,0000,0000,1001,1000)
- Bit
- Reset
- Description

