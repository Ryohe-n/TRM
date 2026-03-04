# 8 -bit eMMC 5.1 8- or 4-bit SDIO 4.1

- HS400 @200 MHz

- SDMMC Controller Functional Description
Notes: 1. 2. 3. 4. Removable MMC is not supported. All SDMMC interfaces have pad calibration support. Only UHS-I interface is supported for SD4.2/SDIO4.1 devices.
- SDMMC1 do not support CQE since these interfaces supports up to eMMC4.51 speeds –
HS200 only. Dual eMMC is not supported. 5.
- Table 10.78 PINMUX Options
- Controller
- Pin Configuration
- Signal
- Ball Name
- Pinmux Select
- SDMMC1
sdmmc1_cmd_cfg
- SDMMC1_CMD
- SDMMC1_CMD
sdmmc1_cmd_pm sdmmc1_clk_cfg
- SDMMC1_CLK
- SDMMC1_CLK
sdmmc1_clk_pm sdmmc1_dat0_cfg
- SDMMC1_DAT0
- SDMMC1_DAT0
sdmmc1_dat0_pm sdmmc1_dat1_cfg
- SDMMC1_DAT1
- SDMMC1_DAT1
sdmmc1_dat1_pm sdmmc1_dat2_cfg
- SDMMC1_DAT2
- SDMMC1_DAT2
sdmmc1_dat2_pm sdmmc1_dat3_cfg
- SDMMC1_DAT3
- SDMMC1_DAT3
sdmmc1_dat3_pm sdmmc1_comp_cfg
- SDMMC1_COMP
- SDMMC1_COMP
sdmmc1_comp_pm soc_gpio_31_cfg
- SDMMC1_WP
- SOC_GPIO_31
soc_gpio_31_pm soc_gpio_11_cfg
- SDMMC1_CD
- SOC_GPIO_11
soc_gpio_11_pm
- SDMMC4
- No pinmuxing
emmc4_cfg
- SDMMC4_CMD
- SDMMC4_CMD
- IOBRICK
emmc4_cfg
- SDMMC4_CLK
- SDMMC4_CLK
- IOBRICK
emmc4_cfg
- SDMMC4_DAT0
- SDMMC4_DAT0
- IOBRICK
emmc4_cfg
- SDMMC4_DAT1
- SDMMC4_DAT1
- IOBRICK
emmc4_cfg
- SDMMC4_DAT2
- SDMMC4_DAT2
- IOBRICK
emmc4_cfg
- SDMMC4_DAT3
- SDMMC4_DAT3
- IOBRICK
emmc4_cfg
- SDMMC4_DAT4
- SDMMC4_DAT4
- IOBRICK
emmc4_cfg
- SDMMC4_DAT5
- SDMMC4_DAT5
- IOBRICK
emmc4_cfg
- SDMMC4_DAT6
- SDMMC4_DAT6
- IOBRICK
emmc4_cfg
- SDMMC4_DAT7
- SDMMC4_DAT7
- IOBRICK
emmc4_cfg
- SDMMC4_DQS
- SDMMC4_DQS
- IOBRICK

- SDMMC Controller Functional Description
- Controller
- Pin Configuration
- Signal
- Ball Name
- Pinmux Select
emmc4_cfg
- SDMMC4_COMP
- SDMMC4_COMP
- IOBRICK
#### 10.10.2.4 SDMMC Clocking
- SDMMC controller’s clock is sourced from either PLLC4 (Primary source) or PLLP (secondary
source) branches. PLLC4 supports spread spectrum (SS) and should be enabled to avoid EMI issues on SD/eMMC interface. PLLC4 VCO runs as per the eMMC part frequency in the platform. PLLP should not be used for eMMC HS400 clocking. If PLLC4 is shared for SDMMC controllers OR QSPI interface post-boot, it’s quite possible that other interfaces (SDMMC1, QSPI, or bridges, etc.) run at compromised (lower than respective engine speed). In such cases, the clocking policy is that eMMC gets the priority because of storage performance.
##### 10.10.2.4.1 Clock Frequency Requirements for SDMMC Operating Modes
The SD and eMMC target IO frequency requirements are given in the tables below.
- Table 10.79 SD Modes
- Speed Mode
- Signal Voltage
I/O Frequency (MHz)
- Bus Width
- Max Throughput (MB/S)
- Default Speed

