# 31 :30 0x0 VENDOR_SPECIFIC_ERR: 0 = DISABLE 3 = ENABLE 0x0 SPI_ERR: 0 = DISABLE 1 = ENABLE 0x0 TARGET_RESP_ERROR: 0 = NO_ERROR 1 = ERROR 0x0 RESP_ERROR: 0 = DISABLE 1 = ENABLE 0x0 TUNING_ERR: 0 = DISABLE 1 = ENABLE 0x0 ADMA_ERR: 0 = DISABLE 1 = ENABLE 0x0 AUTO_CMD12_ERR: 0 = DISABLE 1 = ENABLE 0x0 CURRENT_LIMIT_ERR: 0 = DISABLE 1 = ENABLE 0x0 DATA_END_BIT_ERR: 0 = DISABLE 1 = ENABLE


- SDMMCA Registers
- Bit
- Reset
- Description
0x0 DATA_CRC_ERR: 0 = DISABLE 1 = ENABLE 0x0 DATA_TIMEOUT_ERR: 0 = DISABLE 1 = ENABLE 0x0 COMMAND_INDEX_ERR: 0 = DISABLE 1 = ENABLE 0x0 COMMAND_END_BIT_ERR: 0 = DISABLE 1 = ENABLE 0x0 COMMAND_CRC_ERR: 0 = DISABLE 1 = ENABLE 0x0 COMMAND_TIMEOUT_ERR: 0 = DISABLE 1 = ENABLE 0x0 FX_EVENT: 0 = DISABLE 1 = ENABLE 0x0 RETUNING_EVENT: 0 = DISABLE 1 = ENABLE 0x0 CARD_INTERRUPT: 0 = DISABLE 1 = ENABLE 0x0 CARD_REMOVAL: 0 = DISABLE 1 = ENABLE 0x0 CARD_INSERTION: 0 = DISABLE 1 = ENABLE 0x0 BUFFER_READ_READY: 0 = DISABLE 1 = ENABLE 0x0 BUFFER_WRITE_READY: 0 = DISABLE 1 = ENABLE 0x0 DMA_INTERRUPT: 0 = DISABLE 1 = ENABLE 0x0 BLOCK_GAP_EVENT: 0 = DISABLE 1 = ENABLE

- SDMMCA Registers
- Bit
- Reset
- Description
0x0 TRANSFER_COMPLETE: 0 = DISABLE 1 = ENABLE 0x0 COMMAND_COMPLETE: 0 = DISABLE 1 = ENABLE
- SDMMCA_AUTO_CMD12_ERR_STATUS_0
- Host Control2 Register / Auto CMD Error Status Register
- PRESET_VALUE_ENABLE - Preset Value Enable
Host Controller Version 3.00 supports this bit.
- As the operating SDCLK frequency and I/O driver strength depend on the
- Host System implementation, it is difficult to determine these parameters in
the Standard Host Driver. When Preset Value Enable is set, automatic
- SDCLK frequency generation and driver strength selection is performed
without considering system specific conditions. This bit enables the functions defined in the Preset Value registers. 1 Automatic Selection by Preset Value are Enabled 0 SDCLK and Driver Strength are controlled by Host Driver
- If this bit is set to 0, SDCLK Frequency Select, Clock Generator Select in
the Clock Control register and Driver Strength Select in Host Control 2 register are set by Host Driver.
- If this bit is set to 1, SDCLK Frequency Select, Clock Generator Select in
the Clock Control register and Driver Strength Select in Host Control 2 register are set by Host Controller as specified in the Preset Value registers.
- ASYNC_INTR_EN - Asynchronous Interrupt Enable
- This bit can be set to 1 if a card support asynchronous interrupt and
Asynchronous Interrupt Support is set to 1 in the Capabilities register.
- Asynchronous interrupt is effective when DAT[1] interrupt is used in 4-bit SD
mode (and zero is set to Interrupt Pin Select in the Shared Bus Control register). If this bit is set to 1, the Host Driver can stop the SDCLK during asynchronous interrupt period to save power. During this period, the Host
- Controller continues to deliver Card Interrupt to the host when it is asserted
by the Card. 1 Enabled 0 Disabled
- ADDRESSING_64BIT_EN - 64bit addressing enable
- Host Controller selects either of 32-bit or 64-bit addressing modes to access
system memory. Whether 32-bit or 64-bit is determined by OS installed in a host system. Host Driver sets this bit depends on addressing mode of installed OS. Refer to 64-bit System Address Support in the Capabilities

- SDMMCA Registers
register. 1 64 bits addressing 0 32 bits addressing
- HOST_VERSION_4_EN - Host Version 4.00 Enable
- This bit selects either Version 3.00 compatible mode or Ver4.00 mode. In
- Version 4.00, support of 64-bit System Addressing is modified. All DMAs
support 64-bit System Addressing. UHS-II supported Host Driver shall enable this bit. In Version 4.10, supported 32-bit Block Count for all operations. Functions of following fields are modified. (1) SDMA Address
- SDMA uses ADMA System Address register (05Fh-058h) instead of
- SDMA System Address register (Offset 003-000h)
(2) ADMA2 / ADMA3 Selection ADMA3/CQE is selected by DMA Select in the Host Control 1 register. This bit should be set to 1 to use ADMA3/CQE. (3) 64bit ADMA Descriptor Size 128bit descriptor is used instead of 96-bit descriptor when 64-bit Addressing is set to 1. (4) Selection of 32-bit / 64-bit System Addressing
- Either 32-bit or 64-bit system addressing is selected by 64-bit
Addressing bit in this register instead of DMA Select in the Host Control 1 register. (5) 32-bit Block Count SDMA System Address register (003h-000h) is modified to 32-bit Block Count register. 1 Version 4.00 Mode 0 Version 3.00 Compatible Mode
- CMD23_EN
- In memory card initialization, Host Driver Version 4.10 checks whether card
supports CMD23 by checking a bit SCR[33]. If the card supports CMD23 (SCR[33]=1), this bit is set to 1. This bit is used to select Auto CMD23 orAuto CMD12 for ADMA3 data transfer. Refer to Auto CMD Enable in the Transfer Mode register.
- ADMA2 Length Mode
This bit selects one of ADMA2 Length Modes either 16-bit or 26-bit. 1 26-bit Data Length Mode 0 16-bit Data Length Mode
- UHS2_IF_EN - UHS-II Interface Enable
- This bit is used to enable UHS-II Interface. Before trying to start UHS-II
initialization, this bit shall be set to 1. SD 4-bit Interface signals shall be tri-state (input or bi-directional) or drive to low (output). Before trying to start SD mode initialization, this bit shall be set to. 1 UHS-II Interface Enabled 0 4-bit SD Interface Enabled
- SAMPLING_CLK_SEL - Sampling Clock Select
- Host Controller uses this bit to select sampling clock to receive CMD and

- SDMMCA Registers
- DAT. This bit is set by tuning procedure and valid after the completion of
tuning (when Execute Tuning is cleared). Setting 1 means that tuning is completed successfully and setting 0 means that tuning is failed. Writing 1 to this bit is meaningless and ignored. A tuning circuit is reset by writing to 0.
- This bit can be cleared with setting Execute Tuning. Once the tuning circuit
is reset, it will take time to complete tuning sequence. Therefore, Host Driver should keep this bit to 1 to perform re-tuning sequence to compete re-tuning sequence in a short time. Change of this bit is not allowed while the Host Controller is receiving response or a read data block. Refer to Figure 2-29. 1 Tuned clock is used to sample data 0 Fixed clock is used to sample data
- EXECUTE_TUNING - Execute Tuning
- This bit is set to 1 to start tuning procedure and automatically cleared when
tuning procedure is completed. The result of tuning is indicated to Sampling
- Clock Select. Tuning procedure is aborted by writing 0. Refer to Figure 2-29
for more detail about tuning procedure. 1 Execute Tuning 0 Not Tuned or Tuning Completed
- DRIVE_STRENGTH_SEL - Driver Strength Select
- Host Controller output driver in 1.8V signaling is selected by this bit. In 3.3V
signaling, this field is not effective. This field can be set depends on Driver Type A, C and D support bits in the Capabilities register. This bit depends on setting of Preset Value Enable. If Preset Value Enable = 0, this field is set by Host Driver.
- If Preset Value Enable = 1, this field is automatically set by a value
specified in the one of Preset Value registers. 00b Driver Type B is Selected (Default) 01b Driver Type A is Selected 10b Driver Type C is Selected 11b Driver Type D is Selected
- VOLT_18_EN - 1.8V Signaling Enable
- This bit controls voltage regulator for I/O cell. 3.3V is supplied to the card
regardless of signaling voltage. Setting this bit from 0 to 1 starts changing signal voltage from 3.3V to 1.8V. 1.8V regulator output shall be stable within 5ms. Host Controller clears this bit if switching to 1.8V signaling fails. Clearing this bit from 1 to 0 starts changing signal voltage from 1.8V to 3.3V. 3.3V regulator output shall be stable within 5ms.
- Host Driver can set this bit to 1 when Host Controller supports 1.8V signaling
(One of support bits is set to 1: SDR50, SDR104 or DDR50 in the
- Capabilities register) and the card or device supports UHS-I (S18R=1. Refer
to Bus Signal Voltage Switch Sequence in the Physical Layer Specification Version 3.00). 1 1.8V Signaling 0 3.3V Signaling
- UHS_MODE_SEL - UHS Mode Select

- SDMMCA Registers
- This field is used to select one of UHS-I modes and effective when 1.8V
Signaling Enable is set to 1.
- If Preset Value Enable in the Host Control 2 register is set to 1, Host
- Controller sets SDCLK Frequency Select, Clock Generator Select in the
- Clock Control register and Driver Strength Select according to Preset
- Value registers. In this case, one of preset value registers is selected by this
field. Host Driver needs to reset SD Clock Enable before changing this field to avoid generating clock glitch. After setting this field, Host Driver sets SD Clock Enable again. 000b SDR12 001b SDR25 010b SDR50 011b SDR104(SD/SDIO)/HS200(eMMC) 100b DDR50(SD/SDIO)/DDR52(eMMC) 101b HS400(eMMC) 110b Reserved 111b UHS2
- When SDR50, SDR104 or DDR50 is selected for SDIO card, interrupt
detection at the block gap shall not be used. Read Wait timing is changed for these modes. Refer to the SDIO Specification Version 3.00 for more detail
- COMMAND_NOT_ISSUED - Command Not Issued By Auto CMD12 Error
- Setting this bit to 1 means CMD_wo_DAT is not executed due to an Auto
CMD12 Error (D04-D01) in this register.
- INDEX_ERR - Auto CMD12 Index Error
This bit is set if the Command Index error occurs in response to a command.
- END_BIT_ERR - Auto CMD12 End Bit Error
This bit is set when detecting that the end bit of command response is 0.
- CRC_ERR - Auto CMD12 CRC Error
This bit is set when detecting a CRC error in the command response.
- TIMEOUT_ERR - Auto CMD12 Timeout Error
This bit is set if no response is returned within 64 SDCLK cycles from the end bit of command. If this bit is set to 1, the other error status bits (D04-D02) are meaningless.
- NOT_EXECUTED - Auto CMD12 Not Executed
- If memory multiple block data transfer is not started due to command error,
this bit is not set because it is not necessary to issue Auto CMD12. Setting this bit to 1 means the Host Controller cannot issue Auto CMD12 to stop memory multiple block data transfer due to some error. If this bit is set to 1, other error status bits (D04-D01) are meaningless.
- The relation between Auto CMD12 CRC Error and Auto CMD12 Timeout Error is shown below
------------------|--------------------------|------------------------------- |Auto CMD12 | Auto CMD12 | Kinds of error | |CRC Error | Timeout Error | | |-----------------|--------------------------|-------------------------------| | 0 | 0 | No Error | | 0 | 1 | Response Timeout Error | | 1 | 0 | Response CRC Error |

- SDMMCA Registers
| 1 | 1 | CMD line conflict | ------------------------------------------------------------------------------
- RESP_ERR - Auto CMD Response Error
- This bit is set when Response Error Check Enable in the Transfer Mode
register is set to 1 and an error is detected in either R1 response of either Auto CMD12 or Auto CMD23. 1 Error 0 No Error
- Offset: 0x3c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,00x0,0000,0000,xxxx,xxxx,0x00,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 PRESET_VALUE_ENABLE: 0 = HW_SEL 1 = SW_SEL
- RW
0x0 ASYNC_INTR_EN: 0 = DISABLE 1 = ENABLE
- RW
0x0 ADDRESSING_64BIT_EN: 0 = DISABLE 1 = ENABLE
- RW
0x0 HOST_VERSION_4_EN: 0 = DISABLE 1 = ENABLE
- RW
0x0 CMD23_EN: 0 = DISABLE 1 = ENABLE
- RW
0x0 ADMA2_LEN_MODE: 0 = LEN_16BIT 1 = LEN_26BIT
- RW
0x0 UHS2_IF_EN: 0 = DISABLE 1 = ENABLE
- RW
0x0 SAMPLING_CLK_SEL: 0 = FIXED 1 = TUNED
- RW
0x0 EXECUTE_TUNING: 0 = NOT_TUNED 1 = EXECUTE

- SDMMCA Registers
- Bit
R/W
- Reset
- Description

