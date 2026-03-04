# 11 :8 0x0 TUNING_ASYNC_FIFO_ADDNL_DELAY:

- This register field holds the additional delay in cycles which should be
added to round trip delay Default value is - zero. SW should not update this field unless a new PROD setting is given. 0x0 SD_BUS_POWER_ON_OFF_INT_ENABLE:
- Enables a seperate system interrupt (i.e., not the standard SDHCI
interrupt) when SD_BUS_POWER is changed. 0 = DISABLE 1 = ENABLE 0x0 VOLT_SWITCH_INT_ENABLE:
- Enables a seperate system interrupt (i.e., not the standard SDHCI
interrupt) when VOLT_18_EN is changed. 0 = DISABLE 1 = ENABLE 0x0 TUNING_SYS_INT_ENABLE:
- Enables a seperate system interrupt (i.e., not the standard SDHCI
interrupt) when CMD19 is issued while EXECUTE_TUNING is set. 0 = DISABLE 1 = ENABLE 0x0 ASSERT_BUFF_RD_RDY_INT:
- Write a 1 to this field to assert
sdmmc_interrupt_status_0_buffer_read_ready. Used by the system software that implements the tuning procedure to signal to the standard
- SD driver that the tuning process has completed

