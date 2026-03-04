# 0 - cmd_in(Resp) is sampled by loopback clock which requires tuning 1 - cmd_in(Resp) is sampled by DQS_in which requires no tuning

- SW has to set this bit appropriately based on device capability since this is
an optional feature for eMMC5.x devices. If device supports this feature, SW should set this bit to avoid tuning.

- SDMMCA Registers
- Bit
- Reset
- Description
0x0 USE_TMCLK_FOR_WR_CRC_STATUS_TIMEOUT:
- When set, uses TMCLK data timeout counter for generating
wr_crc_status data-timeout
- When cleared, uses sdmmc_clk for maintaining wr_crc_status data
timeout counter 0x1 USE_NCRC_FOR_WR_CRC_STATUS_TIMEOUT_VAL:
- This field is valid only when USE_TMCLK_FOR_WR_CRC_STATUS_TIMEOUT
is set to 0.
- When cleared, uses data timeout value as wr crc status timeout value
(spec defined one)
- When set, uses Ncrc cycles as timeout value
0x1 USE_TMCLK_FOR_DATA_TIMEOUT:
- When set, uses TMCLK data timeout counter for generating legacy data
timeout error (except wr_crc_status timeout)
- When cleared, uses sdmmc_clk for maintaining data timeout counter

