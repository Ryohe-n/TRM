# 1 , 2, 3. See the Reset chapter for more information on SPI controller reset.

##### 10.14.2.4.5 Slave Mode GPIO Synchronization
Because SPI does not support flow control, the GPIO is required to have the proper communication to avoid any clock loss from the Master. GPIO can be used in the following way for proper synchronization: SPI Slave client software writes to the Config Registers of the SPI controller and make the SPI Slave ready.
- After that, the Slave client software toggles GPIO to inform the Master that the Slave is
ready. Then the SPI Master sends SCK to the Slave device. If there is no GPIO to tell the Master that the Slave is ready, there is a chance to lose clock/data.

- Serial Peripheral Interface (SPI)
- Guidelines
This section provides guidelines for programming the SPI controller: Program all the required Register fields (no particular order is required except for the PIO/ DMA bit, which has to be programmed last):
- Clock Mode
- Packed/Unpacked Mode
- Tx_EN/Rx_EN
- BOTH_EN_BIT
- En_LE_Bit/En_LE_Byte
- BIT_LEN and BLOCK_SIZE values
- CS_SW_HW (software based or hardware based)
- - If CS_SW_HW is set, the value on CS_SW_VAL will be driven out. When CS hardware is used program the setup and hold values in the CS Timing Register.
- Program the DMA Trig values appropriately, if DMA Mode is used
- Enable Interrupts if PIO Mode is used
Program PIO or DMA to indicate the start of transfer. Once the software enables PIO/DMA, no required bits can be changed until the end of transfer except for PIO/DMA bit. Clearing the PIO/DMA bit ends the transaction. In case the SPI controller is configured to Receive Mode and software clears the PIO/DMA bit, then the partial data which the controller received until then will be written into the FIFO. This is true both for Master and Slave. In Slave Mode after PIO or DMA is set, hardware first waits for the CS to go Low by one of the four Masters. Then on reception of SCK, transfer begins. If CS or SCK is removed by the Master in the middle of a transfer, software must terminate the transaction by clearing the PIO/DMA bit. In case of Rx, hardware then writes the last received packet (incomplete packet) to the Rx FIFO. If software does not clear the PIO/DMA bit, the SPI controller will keep waiting for the SCK from the Master. If SCK resumes later, the transaction continues from where it paused earlier. If any error conditions occur, hardware will set the corresponding status bits in the SPI FIFO Control/Status Register and stop the transfer. If IE is enabled, an Interrupt is generated. Software has to clear the source of the Interrupt by writing a "1" to it, after the completion of ISR.
- Special Guidelines for Slave Mode
Software should not program the controller Register when the interface clock is toggling. Software can disable the external clock input before programming the Registers and then re-enable it once all the Registers bits are programmed. One bit was added to the SPI controller (EXT_CLK_EN in Register SPI_MISC_0) to enable external Master clock. Software is required to enable this bit after all other Slave programming is done (after PIO/DMA bit is set). This bit works like a GATE for the external master clock.

- SPI Registers
- Software should not configure Slave Registers or apply reset when external Master clock is
toggling. If needed, software should GATE the clock by writing "0" to this bit and enable back when configuration or reset is done. For a completely successful transfer, the Master starts the actual transfer (enable both CLK and CS) after at least five cycles after EXT_CLK_EN is enabled in the Slave.
- In all other scenarios where the Master started communication to Slave and EXT_CLK_EN is
not enabled in advance, you may see data corruption.
- Guidelines for Transferring Data with GPC-DMA
- When the external device stops sending data after a (unknown) logical boundary, software
programs GPCDMA for the maximum possible data transfer size based on the use case. SPI is programmed for 64B/16W Rx mode as trigger level. GPC-DMA channel is programmed for 64B (16 Words) MMIO burst size.
- GPC-DMA channel is programmed for 64B (16 Words) MC burst size (default value is in the
specification, so there is no need to program explicitly).
- SPI generates an Interrupt to the CPU when all the packets are written to Rx FIFO (for Rx
transfers) or all packets are read from Tx FIFO to send out (for Tx transfers).
- Based on this Interrupt, the software waits until the ongoing DMA transfer is complete by
checking (RXFIFO_COUNT < BURST) or (DMAREQ_RX == Low) before disabling the DMA. If SPI has residual data in the buffer, the software reads it via PIO mode.
##### 10.14.2.4.6 Programming Trimmers
The three programmable trimmers in the SPI controller are used only in Master Mode:
- SPI-Tx trimmer
- This trimmer is used in Master Tx mode to adjust/center the outgoing data with respect to
the outgoing clock.
- SPI-Rx trimmer
- This trimmer is used in Master Rx mode to delay the loopback clock to the Rx shift
- Registers. This trimmer is used to adjust the Master SCK with respect to the SPI Slave
device's Tx data.

