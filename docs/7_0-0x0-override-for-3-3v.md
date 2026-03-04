# 7 :0 0x0 OVERRIDE_FOR_3_3V:

- Maximum override for 3.3V VDD1
- SDMMCA_VENDOR_MISC_CNTRL2_0
- Offset: 0x128
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x62600000 (0b0110,001x,x11x,0000,0000,0000,0000,0000)
- PROD: 0x00000000 (0bx0xx,xx0x,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- PROD
- Description
0x0 _NONE_ VGPIO_MODE_EN:
- SW should set this to 1 when CD and WP pins are
connected to external PMIC/VGPIO and not connected to
- SoC pins
0x1 0x0 SDMMC_CLK_OVR_ON:
- Master clk en Override bit for all SLCGs
0x1 _NONE_ SD_CARD_DETECT_STATUS_N:
- SW should read CD_N status from external PMIC/VGPIO
controller and update this field to get SDMMC present state register gets updated.
- Present state register is read by standard SDHC driver to
know card status. 0 - card detected 1 - no card present in slot 0x0 _NONE_ SD_CARD_WP_STATUS:
- SW should read Write Protect status from external PMIC/
- VGPIO controller and update this field to get SDMMC
present state register gets updated.
- Present state register is read by standard SDHC driver to
know card status. 0 - card is not write protected 1 - card is write protected 0x0 _NONE_ CMD_TFIFO_HOT_RESET:
- SW can reset CMD tuning FIFO present in padmacro
incase there is any error or hang condition.
- Reset duration should be atleast 20 cycles. Set this bit to

