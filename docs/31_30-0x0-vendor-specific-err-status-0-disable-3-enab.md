# 31 :30 0x0 VENDOR_SPECIFIC_ERR_STATUS: 0 = DISABLE 3 = ENABLE 0x0 TARGET_RESP_ERROR: 0 = NO_ERROR 1 = ERROR 0x0 RESP_ERROR: 0 = NO_ERROR 1 = ERROR 0x0 TUNING_ERR: 0 = DISABLE 1 = ENABLE 0x0 ADMA_ERR: 0 = NO_INTERRUPT 1 = INTERRUPT 0x0 AUTOCMD12_ERR: 0 = NO_INTERRUPT 1 = INTERRUPT 0x0 CURRENTLIMIT_ERR: 0 = NO_INTERRUPT 1 = INTERRUPT 0x0 DATA_END_BIT_ERR: 0 = NO_INTERRUPT 1 = INTERRUPT 0x0 DATACRC_ERR: 0 = NO_INTERRUPT 1 = INTERRUPT 0x0 DATATIMEOUT_ERR: 0 = NO_INTERRUPT 1 = INTERRUPT 0x0 COMMAND_INDEX_ERR: 0 = NO_INTERRUPT 1 = INTERRUPT 0x0 COMMAND_END_BIT_ERR: 0 = NO_INTERRUPT 1 = INTERRUPT 0x0 COMMAND_CRC_ERR: 0 = NO_INTERRUPT 1 = INTERRUPT


- SDMMCA Registers
- Bit
- Reset
- Description
0x0 COMMAND_TIMEOUT_ERR: 0 = NO_INTERRUPT 1 = INTERRUPT 0x0 AUTO_CMD12_NOT_ISSUED: 0 = NO_INTERRUPT 1 = INTERRUPT 0x0 AUTO_CMD12_RESP_ERR: 0 = NO_INTERRUPT 1 = INTERRUPT 0x0 AUTO_CMD12_INDEX_ERR: 0 = NO_INTERRUPT 1 = INTERRUPT 0x0 AUTO_CMD12_END_BIT_ERR: 0 = NO_INTERRUPT 1 = INTERRUPT 0x0 AUTO_CMD12_CRC_ERR: 0 = NO_INTERRUPT 1 = INTERRUPT 0x0 AUTO_CMD12_TIMEOUT_ERR: 0 = NO_INTERRUPT 1 = INTERRUPT 0x0 AUTO_CMD12_NOT_EXECUTED: 0 = NO_INTERRUPT 1 = INTERRUPT
- SDMMCA_ADMA_ERR_STATUS_0
- ADMA Error Status Register
--------------------------------------------------------------
- ADMA_LENGTH_MISMATCH_ERR - ADMA Length Mismatch Error
This error occurs in the following 2 cases. (1) While Block Count Enable being set, the total data length specified by the
- Descriptor table is different from that specified by the Block Count and
Block Length. (2) Total data length can not be divided by the block length.
- ADMA_ERR_STATE - ADMA Error State
- This field indicates the state of ADMA when error is occurred during ADMA data
transfer. This field never indicates "10" because ADMA never stops in this state. ----------------------------------------------------------------------------- |D01 - D00 |ADMA Error State when | Contents of SYS_SDR register | | | error is occurred | | -----------------------------------------------------------------------------| | 00 | ST_STOP (Stop DMA) | Points next of the error descriptor| | 01 | ST_FDS (Fetch Descriptor) | Points the error descriptor |

- SDMMCA Registers
| 10 | Never set this state | (Not used) | | 11 | ST_TFR (Transfer Data) | Points the next of the error | | | | descriptor | -----------------------------------------------------------------------------|
- Offset: 0x54
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
0x0 ADMA_LENGTH_MISMATCH_ERR: 0 = NO_ERR 1 = ERR 1:0 0x0
- ADMA_ERR_STATE
- SDMMCA_ADMA_SYSTEM_ADDRESS_0
- ADMA System Address Register
- The 32-bit addressing Host Driver uses lower 32-bit of this register (upper 32-bit
should be set to 0) and shall program Descriptor Table on 32-bit boundary and set 32-bit boundary address to this register. DMA2/3 ignores lower 2-bit of this register and assumes it to be 00b.
- DMA in 64-bit addressing. The 64-bit addressing Host Driver uses all bits of this
register and shall program Descriptor Table on 64-bit boundary and set 64-bit boundary address to this register. DMA2/3 ignores lower 3-bit of this register and assumes it to be 000b. (1) SDMA
- If Host Version 4.00 Enable is set to 1, SDMA use this register to indicate
- System Address of data location instead of using SDMA System Address
register (Offset 003-000h). SDMA can be used in 32-bit and 64-bit addressing in Version 4.00. (2) ADMA2 This register holds byte address of executing command of the Descriptor table.
- At the start of
- ADMA2, the Host Driver shall set start address of the Descriptor table. The
- ADMA increments this register address, which points to next line, when every
fetching a Descriptor line. When the ADMA Error Interrupt is generated, this register shall hold the Descriptor address depending on the ADMA state. (3) ADMA3 This register is set by ADMA3. Host Driver is not necessary to set this register.

- SDMMCA Registers
- The ADMA3 increments address of this register, which points to next line, when
every time fetching a Descriptor line. When Error Interrupt is generated, this register shall hold the Descriptor address depending on the ADMA state.
- Offset: 0x58
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

