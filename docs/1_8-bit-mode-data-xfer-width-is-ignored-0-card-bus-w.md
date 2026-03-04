# 1 :8-bit Mode,DATA_XFER_WIDTH is ignored. 0:Card bus width is as per DATA_XFER_WIDTH value

- DMA Select
- This field is used to select DMA type. The Host Driver shall check support of DMA
modes by referring the Capabilities register. Selected DMA is enabled by DMA
- Enable of the Transfer Mode register in SD mode and DMA Enable of UHS-II
Transfer Mode register in UHS-II mode. (1) Up to Version 3.00
- When Host Version 4 Enable is set to 0, setting of this field is compatible to
Host Controller Version 3.00.
- SDMA is initiated by writing to the Command register when this field is set to
00b and the SDMA System Address register (32-bit) is used. SDMA does not support 64-bit addressing.
- ADMA2 is initiated by writing to the Command register when this field is set to
10b or 11b. Lower 32-bit of the ADMA System Address register is used when this field is set to 10b and 64-bit of the ADMA System Address register is used when this field is set to 11b. Support of 64-bit System Addressing is indicated by 64-bit System Address Support for V3 in the Capabilities register. 64-bit AMDA2 uses 96-bit Descriptor. 00 SDMA is selected 01 Reserved (New assignment is not allowed) 10 32-bit Address ADMA2 is selected 11 64-bit Address ADMA2 is selected (Optional) (2) Version 4.00 or later
- When Host Version 4 Enable is set to 1, setting of this field is changed as
follows. SDMA is initiated by Host Driver writes to the Command register when this

- SDMMCA Registers
field is set to 00b.
- ADMA2 is initiated by Host Driver writes to the Command register when this
field is set to 10b or 11b and by ADMA3 sets to the ADMA System Address register when this field is set to 11b.
- ADMA3 is initiated by Host Driver writes to the ADMA3 ID Address register
when this field is set to 11b. 00 SDMA is selected 01 Not Used (New assignment is not allowed) 10 ADMA2 is selected (AMDA3 is not supported or disabled) 11 ADMA2 or ADMA3/CQE is selected
- Support of 64-bit DMA and 128-bit Descriptor is indicated by 64-bit System
- Address Support for V4 in the Capabilities register. If the support bit is set
to 1, all supported DMAs (depends on Support, ADMA2 Support and
- ADMA3 Support) shall support 64-bit addressing. 64-bit Addressing in the
Host Controller 2 register selects either 32-bit or 64-bit system addressing of DMAs.
- HIGH_SPEED_EN - High Speed Enable
- This bit is optional. Before setting this bit, the Host Driver shall check the High
- Speed Support in the Capabilities register. If this bit is set to 0 (default), the Host
- Controller outputs CMD line and DAT lines at the falling edge of the SD Clock (up to
25MHz). If this bit is set to 1, the Host Controller outputs CMD line and DAT lines at the rising edge of the SD Clock (up to 50MHz).
- If Preset Value Enable in the Host Control 2 register is set to 1, Host Driver needs
to reset SD Clock Enable before changing this field to avoid generating clock glitches. After setting this field, the Host Driver sets SD Clock Enable again.
- DATA_XFER_WIDTH - Data Transfer Width
- This bit selects the data width of the Host Controller. The Host Driver shall set it to
match the data width of the SD card.
- LED_CONTROL - LED Control
- This bit is used to caution the user not to remove the card while the SD card is
being accessed. If the software is going to issue multiple SD commands, this bit can be set during all these transactions. It is not necessary to change for each transaction.
- Offset: 0x28
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,x000,xxxx,0000,xxxx,0000,0000,0000)
- PROD: 0x00000002 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx0x,xx1x)

- SDMMCA Registers
- Bit
- Reset
- PROD
- Description
0x0 _NONE_ WAKEUP_ON_CARD_REMOVAL: 0 = DISABLE 1 = ENABLE 0x0 _NONE_ WAKEUP_ON_CARD_INSERTION: 0 = DISABLE 1 = ENABLE 0x0 _NONE_ WAKEUP_ON_CARD_INTERRUPT: 0 = DISABLE 1 = ENABLE 0x0 _NONE_ INTERRUPT_AT_BLOCK_GAP: 0 = DISABLE 1 = ENABLE 0x0 _NONE_ READ_WAIT_CONTROL: 0 = DISABLE 1 = ENABLE 0x0 _NONE_ CONTINUE_REQUEST: 0 = IGNORED 1 = RESTART 0x0 _NONE_ STOP_AT_BLOCK_GAP_REQUEST: 0 = TRANSFER 1 = STOP 11:9 0x0 _NONE_ SD_BUS_VOLTAGE_SELECT: 5 = V1_8 6 = V3_0 7 = V3_3 0x0 _NONE_ SD_BUS_POWER: 0 = POWER_OFF 1 = POWER_ON 0x0 _NONE_ CARD_DETECT_SIGNAL_DETECT: 0 = SDCD 1 = CARD_DTECT_TST_LVL 0x0 _NONE_ CARD_DETECT_TEST_LVL: 0 = NO_CARD 1 = CARD_INSERTED 0x0
- NOBIT_8
EXTENDED_DATA_TRANSFER_WIDTH: 0 = NOBIT_8 1 = BIT_8 4:3 0x0 _NONE_ DMA_SELECT:
- SW should select ADMA3_CQE in eMMC CMD
queuing mode. 0 = SDMA 1 = RSVD 2 = ADMA2 3 = ADMA3_CQE 0x0 _NONE_ HIGH_SPEED_EN: 0 = NORMAL_SPEED 1 = HIGH_SPEED

- SDMMCA Registers
- Bit
- Reset
- PROD
- Description
0x0
- BIT_4
DATA_XFER_WIDTH: 0 = BIT_1 1 = BIT_4 0x0 _NONE_ LED_CONTROL: 0 = OFF 1 = ON
- SDMMCA_SW_RESET_TIMEOUT_CTRL_CLOCK_CONTROL_0
- Clock Control Register
- SW_RESET_FOR_DAT_LINE - Software Reset For DAT Line
Only part of data circuit is reset. DMA circuit is also reset. The following registers and bits are cleared by this bit:
- Buffer Data Port register
Buffer is cleared and initialized.
- Present State register
- Buffer Read Enable
- Buffer Write Enable
- Read Transfer Active
- Write Transfer Active
- DAT Line Active
- Command Inhibit (DAT)
- Block Gap Control register
- Continue Request
- Stop At Block Gap Request
- Normal Interrupt Status register
- Buffer Read Ready
- Buffer Write Ready
- DMA Interrupt
- Block Gap Event
- Transfer Complete
- SW_RESET_FOR_CMD_LINE - Software Reset For CMD Line
- Only part of command circuit is reset to be able to issue a command. From
- Version 4.10, this bit is also used to initialize UHS-II command circuit. This reset
is effective only command issuing circuit (including response error statuses related to Command Inhibit (CMD) control) and does not affect data transfer circuit. Host Controller can continue data transfer even this reset is executed during handling of sub command response errors. The following registers and bits are cleared by this bit:
- Present State register
- Command Inhibit (CMD)

- SDMMCA Registers
- Normal Interrupt Status register
- Command Complete
- Error Interrupt Status (from Version 4.10)
- Response error statuses related to Command Inhibit (CMD)
- SW_RESET_FOR_ALL - Software Reset For All
This reset affects the entire Host Controller except for the card detection circuit.
- Register bits of type ROC, RW, RW1C, RWAC are cleared to 0. During its
initialization, the Host Driver shall set this bit to 1 to reset the Host Controller. The
- Host Controller shall reset this bit to 0 when Capabilities registers are valid and
the Host Driver can read them. Additional use of Software Reset For All may not affect the value of the Capabilities registers. If this bit is set to 1, the host driver should issue reset command and reinitialize the SD card.
- DATA_TIMEOUT_COUNTER_VALUE - Data Timeout Counter Value
- This value determines the interval by which DAT line timeouts are detected. For
more information about timeout generation, refer to the Data Timeout Error in the
- Error Interrupt Status register. Timeout clock frequency will be generated by
dividing the base clock TMCLK value by this value. When setting this register, prevent inadvertent timeout events by clearing the Data Timeout Error Status
- Enable (in the Error Interrupt Status Enable register)
1111b Reserved 1110b TMCLK x pow(2,27) ................. 0001b TMCLK x pow(2,14) 0000b TMCLK x pow(2,13) There are two types of busy periods in a multiple block write operation. (1) Write busy at block gap (without CMD12) is maximum 250ms (2) Write busy after CMD12 is maximum 250ms (500ms for SDXC) If CMD12 is issued during a multiple block write operation busy period, the host timeout counter is reset and the 250ms (500ms for SDXC) timeout period is measured from the response of CMD12. The duration of an erase command can be estimated by the number of write blocks (WRITE_BL) to be erased multiplied by 250 ms.
- SDCLK_FREQUENCYSELECT - SDCLK Frequency Select
- This register is used to select the frequency of SDCLK pin. The frequency is not
programmed directly; rather this register holds the divisor of the Base Clock
- Frequency For SD Clock in the Capabilities register. Only the following
settings are allowed.
- UPPER_SDCLK_FREQUENCYSELECT - Upper Bits of SDCLK Frequency Select
- Host Controller Version 1.00 and 2.00 do not support these bits and they are
treated as 00b fixed value (ROC).
- Host Controller Version 3.00 shall support these bits to expand SDCLK
- Frequency Select to 10-bit. Bit 07-06 is assigned to bit 09-08 of clock divider in
SDCLK Frequency Select.

- SDMMCA Registers
- CLOCK_GENERATOR_SELECT - Clock Generator Select
- Host Controller Version 3.00 supports this bit. This bit is used to select the clock
generator mode in SDCLK Frequency Select.
- If the Programmable Clock Mode is supported (non-zero value is set to Clock
- Multiplier in the Capabilities register), this bit attribute is RW, and if not
supported, this bit attribute is RO and zero is read.
- This bit depends on the setting of Preset Value Enable in the Host Control 2
register. If the Preset Value Enable = 0, this bit is set by Host Driver.
- If the Preset Value Enable = 1, this bit is automatically set to a value specified
in one of Preset Value registers.
- PLL Enable
- This bit is added from Version 4.10 for Host Controller using PLL. This feature
allows Host Controller to initialize clock generator in two steps: by Internal Clock Enable and PLL Enable and to minimize output latency (ex.
- SDCLK/RCLK, D0 lane) from SD Clock Enable. There are two modes to
keep Host Drivers compatibility. In both modes, PL L Locked timing is indicated by Internal Clock Stable. (1) When Host Version 4 Enable =0 (Host Driver Version 3, which does not support this bit) or this bit is not implemented, Internal Clock Enable (or SD Clock Enable) may activate PLL ( exit low power mode and start locking clock). (2) When Host Version 4 Enable =1 (Host Driver Version 4), Internal Clock Enable is set before setting this bit and then setting this bit may activate PLL (exit low power mode and start locking clock). 1 PLL is enabled 0 PLL is in low power mode
- SD_CLK_EN
- The Host Controller shall stop providing SDCLK or RCLK when writing this bit
to 0. SDCLK/RCLK Frequency Select can be changed when this bit is 0.
- Then, the Host Controller shall maintain the same clock frequency until
- SDCLK is stopped (Stop at SDCLK=0). If the Card Inserted in the Present
State register is cleared, this bit shall be cleared. 1 Enable providing SDCLK or RCLK 0 Disable providing SDCLK or RCLK (1) SD Mode
- This is the case when UHS-II Interface Enable is set to 0 in the Host
- Control 2 register. By setting this bit to 1, SDCLK is provided on pin
number 5 (CLK). Refer to Section 1.12 Controlling SDCLK.
- When PLL is used to generate clock, PLL is enabled by PLL Enable (if
supported) or by SD Clock Enable (if PLL Enable is not supported). When PLL is enabled by PLL Enable, the clock synchronization is checked by Internal Clock Stable.

- SDMMCA Registers
- INTERNAL_CLOCK_STABLE - Internal Clock Stable
- As PLL Enable is added from Version 4.10, this status is expanded to check
two cases. Host Driver Version 4.10 checks clock stability by this status twice after Internal Clock Enable is set and after PLL Enable is set. Refer to Figure 3-3 in SD host spec4.1. (1) Internal Clock Stable (when PLL Enable = 0 or not supported)
- This bit is set to 1 when internal clock is stable after writing to Internal
Clock Enable in this register to 1. (2) PLL Clock Stable (when PLL Enable = 1)
- Host Controller which supports PLL Enable sets this status to 0 once
when PLL Enable is changed 0 to 1 and then this status is set to 1 when
- PLL is locked. (PLL uses an internal clock in stable as a reference clock
which is enabled by Internal Clock Enable). After this bit is set to 1, Host Driver may set SD Clock Enable. 1 Ready 0 Not Ready
- INTERNAL_CLOCK_EN - Internal Clock Enable
- This bit is set to 0 when the Host Driver is not using the Host Controller or the
- Host Controller awaits a wakeup interrupt. The Host Controller should stop its
internal clock to go very low power state. Still, registers shall be able to be read and written. Clock starts to oscillate when this bit is set to 1. When clock oscillation is stable, the Host Controller shall set Internal Clock Stable in this register to 1. This bit shall not affect card detection.
- Offset: 0x2c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,x000,xxxx,0000,0000,0000,000x,0000)
- PROD: 0x00000002 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
R/W
- Reset
- PROD
- Description
- RW
0x0 _NONE_ SW_RESET_FOR_DAT_LINE: 0 = WORK 1 = RESETED
- RW
0x0 _NONE_ SW_RESET_FOR_CMD_LINE: 0 = WORK 1 = RESETED
- RW
0x0 _NONE_ SW_RESET_FOR_ALL: 0 = WORK 1 = RESETED

- SDMMCA Registers
- Bit
R/W
- Reset
- PROD
- Description

