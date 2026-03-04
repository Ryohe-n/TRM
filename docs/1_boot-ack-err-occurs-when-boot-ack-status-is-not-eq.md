# 1 :BOOT_ACK_ERR - Occurs When Boot Ack Status is not equal to '010' 0:BOOT_ACK_TIMEOUT_ERR - Occurs When Boot Ack is not recieved within the programmed number of cycles.

- TARGET_RESP_ERROR - Not supported for Tegra
- SPI_ERR
- Indicate when SPI Error has occured.The SPI Errors are registerd in SPI_INTERRUPT_STATUS
register.
- Response Error
- Host Controller Version 4.00 supports response error check function to avoid
overhead of response error check by Host Driver during DMA execution. If

- SDMMCA Registers
- Response Error Check Enable is set to1 in the Transfer Mode register, Host
- Controller Checks R1 or R5 response. If an error is detected in a response,
this bit is set to 1.
- TUNING_ERR
- This bit is set when an unrecoverable error is detected in a tuning circuit
except during tuning procedure (Occurrence of an error during tuning procedure is indicated by Sampling Select). By detecting Tuning Error, Host
- Driver needs to abort a command executing and perform tuning. To reset
tuning circuit, Sampling Clock shall be set to 0 before executing tuning procedure (refer to Figure 2-29).
- ADMA_ERR
- This bit is set when the Host Controller detects errors during ADMA based data
transfer. The state of the ADMA at an error occurrence is saved in the ADMA
- Error Status Register,
- In addition, the Host Controller generates this Interrupt when it detects invalid
descriptor data (Valid=0) at the ST_FDS state. ADMA Error State in the
- ADMA Error Status indicates that an error occurs in ST_FDS state. The Host
Driver may find that Valid bit is not set at the error descriptor.
- AUTO_CMD12_ERR
- Auto CMD12 and Auto CMD23 use this error status. This bit is set when
detecting that any of the bits D00 to D05 in Auto CMD Error Status register has changed from 0 to 1. D07 is effective in case of Auto CMD12. Auto CMD
- Error Status register is valid while this bit is set to 1 and may be cleared with
clearing of this bit (another implementation is also allowed).
- CURRENT_LIMIT_ERR
- By setting the SD Bus Power bit in the Power Control register, the Host Controller
is requested to supply power for the SD Bus. If the Host Controller supports the
- Current Limit function, it can be protected from an illegal card by stopping power
supply to the card in which case this bit indicates a failure status. Reading 1 means the Host Controller is not supplying power to SD card due to some failure. Reading 0 means that the Host Controller is supplying power and no error has occurred.
- The Host Controller may require some sampling time to detect the current limit. If
the Host Controller does not support this function, this bit shall always be set to 0.
- DATA_END_BIT_ERR
- Occurs either when detecting 0 at the end bit position of read data which uses the
DAT line or at the end bit position of the CRC Status.
- DATA_CRC_ERR
- Occurs when detecting CRC error when transferring read data which uses the DAT
line or when detecting the Write CRC status having a value of other than "010".
- DATA_TIMEOUT_ERR
Occurs when detecting one of following timeout conditions. (1) Busy timeout for R1b,R5b type (2) Busy timeout after Write CRC status (3) Write CRC Status timeout (4) Read Data timeout.
- COMMAND_INDEX_ERR

- SDMMCA Registers
Occurs if a Command Index error occurs in the command response.
- COMMAND_END_BIT_ERR
Occurs when detecting that the end bit of a command response is 0.
- COMMAND_CRC_ERR
Command CRC Error is generated in two cases. (1) If a response is returned and the Command Timeout Error is set to 0 (indicating no timeout), this bit is set to 1 when detecting a CRC error in the command response. (2) The Host Controller detects a CMD line conflict by monitoring the CMD line when a command is issued. If the Host Controller drives the CMD line to 1 level, but detects 0 level on the CMD line at the next SDCLK edge, then the
- Host Controller shall abort the command (Stop driving CMD line) and set this
bit to 1. The Command Timeout Error shall also be set to 1 to distinguish
- CMD line conflict
- COMMAND_TIMEOUT_ERR
- Occurs only if no response is returned within 64 SDCLK cycles from the end bit of
the command. If the Host Controller detects a CMD line conflict, in which case
- Command CRC Error shall also be set as shown in Table 2-25, this bit shall be
set without waiting for 64 SDCLK cycles because the command will be aborted by the Host Controller.
- ERR_INTERRUPT
If any of the bits in the Error Interrupt Status register are set, then this bit is set. Therefore the Host Driver can efficiently test for an error by checking this bit first. This bit is read only.
- FX_EVENT
- This status is added from Version 4.10. Bit06 of response data will be
stored in the R[14] of the Response register.
- Basically, this interrupt is used with response check function. In this case,
this status is set when R[14] of Response register is set to 1 and Response Type R1 / R5 is set to 0 in the Transfer Mode register or UHSII Transfer Mode register.
- If response check is disabled, this status is set when R[14] of Response
register is set to 1. Host Driver needs to screen FX Event interrupt by checking response type is R1. 1 FX_EVENT is detected 0 No Event
- RETUNING_EVENT - Re-Tuning Event
- This status is set if Re-Tuning Request in the Present State register
changes from 0 to 1.
- Host Controller requests Host Driver to perform re-tuning for next data
transfer. Current data transfer (not large block count) can be completed without re-tuning. 1 Re-Tuning should be performed 0 Re-Tuning is not required
- CARD_INTERRUPT
- Writing this bit to 1 does not clear this bit. It is cleared by resetting the SD card
interrupt factor. In 1-bit mode, the Host Controller shall detect the Card Interrupt

- SDMMCA Registers
without SD Clock to support wakeup. In 4-bit mode, the card interrupt signal is sampled during the interrupt cycle, so there are some sample delays between the interrupt signal from the SD card and the interrupt to the Host System. It is necessary to define how to handle this delay.
- CARD_REMOVAL
This status is set if the Card Inserted in the Present State register changes from 1 to 0.
- When the Host Driver writes this bit to 1 to clear this status, the status of the Card
- Inserted in the Present State register should be confirmed. Because the card
detect state may possibly be changed when the Host Driver clear this bit and interrupt event may not be generated.
- CARD_INSERTION
This status is set if the Card Inserted in the Present State register changes from 0 to 1.
- When the Host Driver writes this bit to 1 to clear this status, the status of the Card
- Inserted in the Present State register should be confirmed. Because the card
detect state may possibly be changed when the Host Driver clear this bit and interrupt event may not be generated.
- BUFFER_READ_READY
- This status is set if the Buffer Read Enable changes from 0 to 1. Refer to the
Buffer Read Enable in the Present State register.
- BUFFER_WRITE_READY
- This status is set if the Buffer Write Enable changes from 0 to 1. Refer to the
Buffer Write Enable in the Present State register.
- DMA_INTERRUPT
- This status is set if the Host Controller detects the Host DMA Buffer boundary
during transfer. Refer to the Host DMA Buffer Boundary in the Block Size register.
- Other DMA interrupt factors may be added in the future. This interrupt shall not be
generated after the Transfer Complete.
- BLOCK_GAP_EVENT
- If the Stop At Block Gap Request in the Block Gap Control register is set, this bit
is set when both a read / write transaction is stopped at a block gap. If Stop At Block Gap Request is not set to 1, this bit is not set to 1.
- XFER_COMPLETE
This bit indicates stop of transaction on three cases: (1) Completion of a data transfer (2) Completion of a command pairing with response-with-busy (R1b, R5b) (3) Stop of data transfer by setting Stop At Block Gap Request in the Block Gap Control register
- CMD_COMPLETE
- This bit is set when get the end bit of the command response. (Except Auto CMD12)
Refer to Command Inhibit (CMD) in the Present State register.
- Offset: 0x30
- Read/Write: See table below
- Parity Protection: N
- Shadow: N

- SDMMCA Registers
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0x00,xxx0,0000,0000)
- Bit
R/W
- Reset
- Description

