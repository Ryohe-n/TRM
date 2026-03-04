# 0 = DISABLE 1 = ENABLE 0x0 IO_TRIM_BYPASS:

- Override bit for selecting between core trimmer (Vcore dependent) and io
trimmer (custom trimmer) in IB clock path Default option is IO trimmer; SW should not set this field. 0x1 INT_MASK_WHILE_TUNING:
- As per spec, Host should not generate any interrupts (including
cmd_complete and data_xfer_complete) except buffer_read_ready interrupt during tuning sequence is being performed
- SW can override this behavior by clearing this bit - but this leads to a spec
violation 0 = DISABLE 1 = ENABLE 0x0 SPI_MODE: This mode is not supported in Tegra.
- SDMMCA_VENDOR_ERR_INTR_STATUS_0
- Legacy Interrupt Status Register

- SDMMCA Registers
The fields are valid when a error interrupt has occurred.
- Offset: 0x108
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x000X0000 (0bxxxx,xxxx,xxxx,xx00,0000,xxx0,0000,0000)
- Bit
- Reset
- Description
X SDMMC_LEGACY_CTLR_IDLE: indicates legacy SD interface controller is idle - no active data transfers on legacy SD interface 0x0 READ_DATA_TIMEOUT: valid when a data timeout error occurs 0x0 WRITE_CRC_STATUS_TIMEOUT: valid when a data timeout error occurs 0x0 WRITE_BUSY_TIMEOUT: valid when a data timeout error occurs 0x0 RESP_BUSY_TIMEOUT: valid when a data timeout error occurs 0x0
- SPI_WRITE_BUSY_TIMEOUT
0x0
- SPI_RX_START_TOKEN_TIMEOUT

