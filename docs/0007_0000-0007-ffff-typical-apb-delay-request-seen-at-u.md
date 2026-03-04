# 0007 :0000 0007:ffff Typical APB delay (request seen at UART controller interface to response) is two APB cycles.

#### 10.12.2.2 16450 Mode Programming
1. 2. 3. 4. 5. 6. 7. 8. 9. Program pinmux settings to select a UART. Enable the UART clocks. Apply module reset. If internal loopback is needed, program MCR[4] to 1. Program FCR[0] to 0. Enable interrupts in the IER register as needed. Write data into the THR register. Wait for a THR interrupt, if enabled, or poll for LSR[5]. During a receive, wait for an RDR interrupt or poll for LSR[0]/LSR[9]. Read the UART.LSR register to clear interrupts. 10.
#### 10.12.2.3 16550 Mode Programming
1. 2. 3. 4. 5. 6. 7. 8. 9. Program pinmux settings to select a UART. Enable the UART clocks. Apply module reset. For enabling internal loopback, program MCR[4] to 1. Program FCR[0] to 1. Poll IIR[6] to see if FIFO_MODE is really enabled. Program trigger levels as required. Enable interrupts in the IER register as needed. Write data into the THR register. Wait for a THR interrupt, if enabled, or poll for LSR[5]. 10.

- Universal Asynchronous Receiver/Transmitter (UART)
11. 12. 13. During a receive, wait for an RDR interrupt or poll for LSR[0]/LSR[9]. Read the UART.LSR register to clear interrupts. GPC DMA requester numbers for UARTs A/1, B/2, C/3, D/4, E/5, F/6, G/7, and H/8 are 8, 9, 3, 19, 20, 12, 2, and 13, respectively.
- Interface
- DMA Flow Control Mapping
- UART1
- GPC DMA + CBB's AXI2APB Bridge
- UART2
- GPC DMA + CBB's AXI2APB Bridge
- UART3
- AON Cluster DMA, BPMP DMA, and GPC DMA + CBB's AXI2APB Bridge
- UART4
- GPC DMA + CBB's AXI2APB Bridge
- UART5
- GPC DMA + CBB's AXI2APB Bridge
- UART6
- AON Cluster DMA and GPC DMA + CBB's AXI2APB Bridge
- UART8
- AON Cluster DMA and GPC DMA + CBB's AXI2APB Bridge
##### 10.12.2.3.1 UART Instances to GPCDMA Mapping
LSIO instances:
- UART1/A – 8
- UART2/B – 9
- UART4/D – 19
- UART5/E – 20
- UART6/F – 12
- UART8/H – 13
AON UART instances:
- UART3/C – 3
#### 10.12.2.4 Transmitter and Receiver Holding Registers
The serial transmitter section consists of a Transmit Hold Register (THR) and Transmit Shift Register (TSR). The status of transmit hold register is provided in the Line Status Register (LSR). Writing to this register (THR) transfers the contents of data bus (D [7:0]) to the Transmit Holding Register whenever the Transmit Holding Register or Transmit Shift Register is empty. The Transmit Holding Register empty flag is set to 1 when the transmitter is empty or data is transferred to the Transmit Shift Register. Note that a write operation is performed when the Transmit Holding Register empty flag is set.

- Universal Asynchronous Receiver/Transmitter (UART)
The serial receiver section also contains an 8-bit Receiver Holding/Buffer Register (RBR). Receive data is removed from the UART and received by the processor by reading the RBR. The receiver contains a mechanism for preventing false starts as follows: On the falling edge of the start bit, the receiver internal counter starts to count 7.5 clocks (16x clock), which is the center of the start bit. If the input goes high before counter reaches mid-point sampling, RX_FSM is moved back to the IDLE state and that is treated as a start bit glitch. Verifying the start bit prevents the receiver from assembling a false data character due to a low going noise spike on the Rx input. Receiver status codes are posted in the Line Status Register.
#### 10.12.2.5 FIFO Interrupt Mode Operation
When the receive FIFO (FCR bit 0 = 1) and receive interrupts (IER bit 0 = 1) are enabled, a receiver interrupt occurs as follows:
- The receive data available interrupts are issued to the CPU when the FIFO has reached its
programmed trigger level; it is cleared as soon as the FIFO drops below its programmed trigger level. The ISR receive data available indication also occurs when the FIFO trigger level is reached, and like the interrupt, it is cleared when the FIFO drops below the trigger level.
- The data ready bit (LSR bit 0) is set as soon as a character is transferred from the shift
register to the receiver FIFO. It is reset when the FIFO is empty.
#### 10.12.2.6 FIFO Polled Mode Operation
When FCR bit 0 = 1; clearing IER bits [3:0] to zero puts the UART in the FIFO polled mode of operation. Since the receiver and transmitter are controlled separately, either one or both can be in the polled mode operation by using the line status register as follows:
- LSR bit 0 is set when the number of entries is greater than or equal to trigger level
programmed
- LST bits [4:1] specifies which error(s) has occurred
- LSR bit 5 indicates when the transmit FIFO is empty
- LSR bit 6 indicates when both transmit FIFO and transmit shift registers are empty
- LSR bit 7 indicates when there are any errors in the receive FIFO
- LSR bit 8 indicates when the transmit FIFO is full
- LSR bit 9 indicates Rx FIFO empty status
The UART requires a two-step FIFO enable operation in order to enable receive trigger levels.

- Universal Asynchronous Receiver/Transmitter (UART)
#### 10.12.2.7 Programmable Baud Rate Generator
The UART contains a programmable baud rate generator that is capable of taking the UART clock input and dividing it by any divisor from 1 to 216-1 The UART clocks are defined in the Clocking chapter. The output frequency of baudout is equal to 16X the transmission baud rate (Baudout=16 X baud rate). Customized baud rates are achieved by selecting proper divisor values for the MSB and LSB bits of the baud rate generator.
#### 10.12.2.8 Enable Register
There is an Interrupt Enable Register (IER) for each UART. The Interrupt Enable Register(s) masks the incoming interrupts from the receiver ready, transmitter empty, and line status.
#### 10.12.2.9 Interrupt Identification Register
The UART provides four level prioritized interrupt conditions to minimize software overhead during data character transfers. The Interrupt Identification Register (IIR) provides the source of the interrupt in a prioritized manner. During the read cycle, the 16550 provides the highest interrupt level to be serviced by the CPU. No other interrupts are acknowledged until the particular interrupt is serviced. The prioritized interrupt levels are shown in the table below. The Receive Data Time-out mode is enabled when the UART is operating in the FIFO mode. Receive time-out does not occur if the receive FIFO is empty. The time-out counter is reset at the center of each stop bit received or each time the receive holding register is read. The actual time out value is: T (Time out length in bits) = 4xP (Programmed work length) + 12 To convert the time-out value to a character value, divide this number to its complete word length + parity (if used) + number of stop bits and start bit.
- Example
If you program the word length = 7, no parity, and one stop bit, the time-out is: T = 4x7 (programmed word length) + 12 = 40 bits.
- Character time = 40/9
(Programmed word length = 7) + (stop bit = 1) + (start bit = 1) =4.4 characters

- Universal Asynchronous Receiver/Transmitter (UART)
- Table 10.100 Prioritized Interrupt Levels
- Priority
- D3
- D2
- D1
- D0
- Interrupt Source Description
- LSR (Receiver Line Status Register)
- RXRDY (Received Data Ready)
- RXRDY (Received Data Timeout)
- TXRDY (Transmitter Holding Register)
- MSR (Modem Status Register)
#### 10.12.2.10 FIFO Control Register
##### 10.12.2.10.1 FIFO Control Register Modes
The FIFO control register (FCR) is used to enable the FIFOs, clear the FIFOs, set the receiver FIFO trigger level, and select the type of DMA signaling.
##### 10.12.2.10.2 FIFO Mode (CR bit 0 = 1)
FCR bit 0 should be programmed to '1' to operate the UART controller in FIFO (16450) mode. When FIFO mode is enabled, allow minimum of three baud cycles duration before writing TX_DATA into the THR_DLAB register. Design requirement: It takes three baud cycles for the fifo_mode enable signal to synchronize to the baud_clk domain and ~fifo_mode_bclk is also a flush condition for Tx and Rx FIFOs. When FIFO mode is enabled through a register write in the pclk domain and if there is not enough delay before servicing THRE interrupt/NTXRDY requests, the written data is lost. To ensure proper data transfer, after fifo_mode is enabled for first time through register write, give a delay of minimum of three baud cycles before writing TX_DATA into the THR register. The operation of the FCR in the four DMA modes is given below.
##### 10.12.2.10.3 Transmit Operation in DMA Mode 0 or Mode 1
When the UART is in the 16450 mode (FCR bit 0 = 0) or in the FIFO mode (FCR bit 0 = 1, FCR bit 3 = 0) and when there are no characters in the transmit FIFO or Transmit Holding Register, the TXRDY* pin goes low. Once active, the TXRDY* pin goes high (inactive) after the first character is loaded into the Transmit Holding Register.

- Universal Asynchronous Receiver/Transmitter (UART)
##### 10.12.2.10.4 Receive Operation in DMA Mode 0
When the UART is in 16450 mode (FCR bit 0 = 0) or in the FIFO mode (FCR bit 0 = 1, FCR bit 3 = 0) and there is at least 1 character in the receive FIFO, the RXRDY* pin goes low. Once active, the RXRDY* pin goes high (inactive) when there are no more characters in the receiver.
##### 10.12.2.10.5 Receive Operation in DMA Mode 1
When the UART is in the FIFO mode (FCR bit 0 = 1, FCR bit 3 = 1) and the trigger level or the timeout has been reached, the RXRDY* pin goes low. Once it is activated, it goes high (inactive) when there are no more characters in the FIFO.
#### 10.12.2.11 Line Control Register
The Line Control Register (LCR) is used to specify the asynchronous data communication format. The word length, stop bits, and parity can be selected by writing appropriate bits in this register.
#### 10.12.2.12 Modem Control Register
The Modem Control Register (MCR) controls the interface with the modem or a peripheral device (RS232).
##### 10.12.2.12.1 Loopback Mode
If MCR[4] = 1, the loopback mode is enabled, and the following occurs: The receiver input (Rx), CTS, DSR, CD, and RI are disabled. Internally, the transmitter output is connected to the receiver input and DTR, RTS, OP1, and OP2 are connected to modem control inputs. In this mode, the receiver and transmitter interrupts are fully operational, but the interrupt sources are now the lower four bits of the Modem Control Register instead of the four modem control inputs. The interrupts are controlled by the IER register.
#### 10.12.2.13 Line Status Register
The Line Status Register (LSR) provides the status of data transfer to the CPU.
#### 10.12.2.14 Modem Status Register
The Modem Status Register (MSR) provides the current state of the control lines from the modem or peripheral to the CPU. Four bits of this register are used to indicate the changed information. These bits are set to "1" whenever a control input from the modem changes state. They are set to "0" whenever the CPU reads the register.

- Universal Asynchronous Receiver/Transmitter (UART)
#### 10.12.2.15 Scratchpad Register
Eight bits of information can be stored in the Scratchpad Register (SR). Information in this register does not affect the operation of the device in any way.
#### 10.12.2.16 Auto-Baud Sense Register
- The UART can automatically determine the correct baud divisor by using the auto-baud sense
register (UART offsets 0x3C). The most significant bit of this register is the valid flag. A write to this register clears the valid flag and enable the auto-baud process. When the first Rx edge occurs, a counter running at 24 MHz starts counting. When another rx_edge occurs, the "complete" flag is set, the value is frozen, and the auto-baud sense value register is updated with the count value. The low 20 bits of the Auto-Baud Sense Register (ASR) give the number of clocks within a single bit. Because the UART uses 16x oversampling, the resulting value needs to be adjusted by shifting right 4 bits, then loading the resulting count in the divisor latch of the UART. (In the code snippet below, the lower 4 bits are rounded to give slightly greater accuracy.) Because the speed determination is made by measuring the start bit, special characters must be sent by the transmitting UART to guarantee that the next character after the start bit is a 1. Since bit 0 (rightmost bit) is sent first, the ASCII Carriage Return character (CR) is sufficient to enable proper speed sense. The following code snippet returns the values for DLH and DLL in r9, r8:
- MOV r0, #1 ; dummy write data
- STRB r0, \[r3, #U_ASR\]; Start autobaud sense (r3 as uart_base)
; now poll the autobaud sense register MSB until Valid is true wait4valid
- LDR r2, \[r3, #U_ASR\]; Read ASR
- TST r2, #0x80000000 ; the Valid bit (active high)
- BEQ wait4valid
; autobaud sense check complete... ; r2 as number of 1x clocks in one bit time ; representing the number of 24MHz clocks in the start bit ; Since this represents 16 of the baud (16x) clocks, we ; will be dividing by 16 to get baud divisor, but first ; round to nearest by adding 8 before the divide:
- ADD r4, r2, #8 ; add 1/2 resolution
- MOV r6, r4, LSR #4 ; divide by 16... R6 will have total divisor
- AND r8, r6, #0xFF ; copy DLL to r8
- MOV r9, r6, LSR #8 ; copy DLM to r9
- AND r9, r9, #0xff ; mask upper bytes

- Universal Asynchronous Receiver/Transmitter (UART)
#### 10.12.2.17 Baud Rate Generator
The following table is a divisor table for the baud rate, assuming the oscillator is 24.000 MHz.
- Divisor = (osc clock/(baud rate*16))*106
- Table 10.101 Baud Rate Generator Programming
- Baud Rate
- Divisor
19.2K 38.4K 57.6K 115.2K 460.8K
#### 10.12.2.18 SIR Pulse Encoder/Decoder
The UART transmit (Tx) data is passed through the SIR Pulse Encoder/Decoder module prior to being muxed out to the IR transmitter. This module converts transmitted zeros into a 3/16 Return- To-Zero (RZ) pulse. Similarly, received (Rx) data is bit-synchronized using the 16x baud clock and the original serial data recovered from the IR bit stream. This data is then sent to the UART for reception. The signal generated in SIR is as follows: On logic '1' the LED is off. On logic '0' a pulse is created starting the center of the bit time and lasting 3/16 of bit time period or 4/16 of bit time period depending on the current settings. The figure below displays the output for the input 101001 (in sending order) in SIR encoding. If SIR encoding/decoding has to be used in loopback mode, the following programming guideline/ sequence is required: 1.
- Program SIR enable

- Universal Asynchronous Receiver/Transmitter (UART)
2. 3.
- Wait for a minimum of (4*baudclk)+ ( 4clk24m)
- Program loopback enable
**Figure 10.151 Output in Sending Order in SIR Encoding**
#### 10.12.2.19 UART Interrupts and Interrupt Service Routine
There are multiple conditions on which a UART interrupt is generated. The following are interrupts available for the UART controller. Each of the interrupts is routed to an interrupt controller, if the corresponding Interrupt enable bit in the IER register is set. 1.
- EORD: This indicates an end of received data interrupt. This interrupt is set when UART Rx
detects there is no data being received for more than four character times. This is useful to determine that the transmitter is done with sending all its data. In FIFO mode, this interrupt is not generated if data is stopped because of handshaking.
- RXT: RX_TIMEOUT interrupt occurs when data has been sitting in RX_FIFO for more than
four character times due to some reason. One reason could be because there is not enough data to reach the trigger level. This interrupt needs to be handled by software to have data reception in a timely manner. RXS: This interrupt indicates there are errors detected in the received data. The error could be break error/overrun error/parity error or framing error. A Break error occurs when a break condition (all zeros) has been detected on an Rx line. An Overrun error indicates a new character reception from an external device when the Rx FIFO is already full. Parity error occurs because of parity mismatch and framing error occurs when stop bit of a character received is '0' instead of '1'. Handling framing errors: When a framing error is detected at UART Rx, the reference point for further sampling is lost. UART Rx needs the line to be continuous HIGH for at least one character time to recover the sampling point. All subsequent data after framing error detection needs to be discarded by software (clear IER[0] before flushing the FIFO to avoid any spurious interrupt). 2. 3. 4.

- Universal Asynchronous Receiver/Transmitter (UART)
Retransmission is required on framing error cases. This needs some protocol at a higher level than the UART. When there is framing error seen by software, the UART line needs to be maintained HIGH for at least one character time to let Rx recover. This has to be completely handled by software. For a 4-pin UART, RTS can be used to stop further reception of data until Rx recovers.
- Force RTS to let Tx stop sending further data
- Rx given enough time to recover
- Deassert RTS
- Start receiving further data
5. 6. 7. 8. a. THR: This interrupt indicates the Transmit Holding Register is empty. In FIFO mode, this is set when there is enough space in the FIFO based on trigger level setting so that software can start writing Tx data into the THR register.
- RDR: Receive data ready interrupt is asserted when number of entries in RX_FIFO has
reached the trigger level programmed when in FIFO mode. This bit is an indicator to start reading the contents of RX_FIFO. While servicing RDR, disable the RXT interrupt and enable it after RDR is serviced. b. When uart_intr is asserted, software reads the IIR register to know which interrupt occurred. The interrupts in the UART are prioritized and hence IIR always shows the current highest priority interrupt. If more than one interrupt is pending to be serviced, the one with the highest priority is shown in IIR. When all interrupts have been serviced, IIR shows no_interrupt. The interrupt priority is defined per the encoding below (the priorities are listed highest to lowest): IIR[3:0] priority level: 0001: no interrupt pending 0110: Overrun Error, Parity Error, Framing Error, Break 0100: Receiver Data Available 1100: rx_timeout_intr 1000: eord_timeout_intr 0010: Transmitter Holding Register empty 0000: modem_status interrupt The interrupt service routine (ISR) for UART interrupts is not same for all and varies depending on type of interrupt. This section summarizes the ISR expected for clearing each of the interrupt condition. RXS interrupt: LSR read clears this interrupt. RXS interrupt conditions include parity/break/ overrun or framing error. Parity/break/framing errors also clear on Rx FIFO pop operation.
- RDR/RX_TIMEOUT interrupt: These interrupts are cleared on reading the Read buffer register
EORD interrupt: IER[5] needs to be disabled to clear this interrupt. The bit can be re-enabled again to receive further interrupts.

- Universal Asynchronous Receiver/Transmitter (UART)
THR interrupt: IIR read or write to buffer data register clears this interrupt. The interrupt keeps occurring until writes are performed to buffer the write register to fill the FIFO and reach the trigger level.
- Disabling an interrupt_enable bit for any of the following interrupts lead to clearing of
uart_intr.
- Bit
- Reset
- Description
0x0
- IE_MSI: Interrupt Enable for Modem Status Interrupt

