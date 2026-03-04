# 1 word extra compared to what is actually present in the Rx FIFO.


- Serial Peripheral Interface (SPI)
In Non-continuous Mode, the SPI Controller does not generate a CS_DEASSERT Interrupt at the very end when the actual programmed blk_size is done. That time CS is deasserted by the Master normally. Software will get a completion Interrupt in this case.
- CS_INACTIVE Bit in SPI FIFO Control/Status Register (SPI_FIFO_STATUS_0)
In the CS deassert case, the SPI controller can generate Interrupts, provided the Interrupt Mask bit is set Low (Interrupt enabled) by software and (SPI_FIFO_STATUS_0.CS_INACTIVE == 1) indicating CS is deasserted by an External Master. Software needs to clear this bit while addressing the Interrupt. On the other hand, if the Interrupt Mask bit is set High (Interrupt not enabled), SPI_FIFO_STATUS_0.CS_INACTIVE may still be set High by the SPI Controller but will not generate an Interrupt. If the CS deassert Interrupt mask is set Low (i.e., the Interrupt is enabled), the SPI Slave Controller generates an Interrupt when all the data in the Rx shift Register is written into the Rx FIFO. Whenever external master deasserts CS, SPI slave will always set the CS_INACTIVE status bit and generate interrupt based on interrupt mask. Pause is a feature which when set will not terminate the transfer in case of CS deassertion by external master.
- In both the above cases, CS deassertion Interrupt generation is independent of the Clock
provided by the External Master.
- FRAME_END in SPI FIFO Control/Status Register
- In Slave Continuous Mode, if SCK is not received for the number of clocks specified in the
SLV_IDLE_COUNT field and CS is asserted, then the continuous mode is terminated and this status bit is set. Continuous Mode is terminated if the condition is met. In this case, an Interrupt is generated. Software has two use cases: 1. In Slave Continuous mode, software mainly will use the pause feature (set PAUSE bit to "1"), because the use case is such that there will be continuous audio streaming and it is not desired for the Slave to be stopped based on CS deassert. In Slave non-continuous mode, where the use case is based on variable length data coming in from the external Master, software will use the non-pause feature (enable the CS deassert
- Interrupt) so that software can read the received chunk of data based on the CS deassert
Interrupt with frame_end remaining deasserted. 2.
- In the Non-Pause case, continuous mode termination can happen with CS deasserted or DMA
disabled (DMA_EN = 0).In the Pause case, continuous mode termination can happen only with DMA disable. Until the DMA is disabled, it is the same continuous mode transaction and continues forever until the DMA is disabled.

- Serial Peripheral Interface (SPI)
#### 10.14.2.3 Error Conditions
When the SPI controller is configured as a Master, the following error scenarios can happen:
- Tx FIFO Overflow
Tx FIFO overflow occurs when the DMA writes into the Tx FIFO when it is full. In this case, the SPI controller terminates the transaction by setting the PIO/DMA_EN bit to "0," and flags the error by setting the TX_FIFO_OVF bit in the SPI FIFO Status Register to "1." The
- SPI controller generates an Interrupt if the TX_FIFO_OVF_INTR_MASK bit in the
- SPI_INTR_MASK_0 register is turned off (thus, allowing the Interrupt). Software must
remove the cause of Tx FIFO Overflow and clear the TX_FIFO_OVF bit by writing "1" to it.
- To start a new transaction, software must flush the Tx FIFO by writing "1" to the
TX_FIFO_FLUSH bit in the SPI FIFO Status Register.
- Rx FIFO Overflow
Rx FIFO overflow occurs when the DMA writes into the Rx FIFO when it is full. In this case, the SPI controller terminates the transaction by setting the PIO/DMA_EN bit to "0," and flags the error by setting the RX_FIFO_OVF bit in the SPI FIFO Status Register to "1." The
- SPI controller generates an Interrupt if the RX_FIFO_OVF_INTR_MASK bit in
the SPI_INTR_MASK_0 register is turned off (thus, allowing the Interrupt). Software must remove the cause of Rx FIFO Overflow and clear the RX_FIFO_OVF bit by writing "1" to it.
- To start a new transaction, software must flush the Rx FIFO by writing "1" to the
RX_FIFO_FLUSH bit in the SPI FIFO Status Register.
- Tx FIFO Underflow
- Tx FIFO Underflow occurs when the DMA reads from the Tx FIFO when it is empty. In this
case, the SPI controller terminates the transaction by setting the PIO/DMA_EN bit to "0," and flags the error by setting the TX_FIFO_UNF bit in the SPI FIFO Status Register to "1." The SPI controller generates an Interrupt if the TX_FIFO_UNF_INTR_MASK bit in the SPI_INTR_MASK_0 register is turned off (thus, allowing the Interrupt). Software must remove the cause of Rx FIFO Overflow and clear the TX_FIFO_UNF bit by writing "1" to it before a new transaction can start.
- Rx FIFO Underflow
- Rx FIFO Underflow occurs when the DMA reads from the Rx FIFO when it is empty. In this
case, the SPI controller terminates the transaction by setting the PIO/DMA_EN bit to "0," and flags the error by setting the RX_FIFO_UNF bit in the SPI FIFO Status Register to "1." The SPI controller generates an Interrupt if the RX_FIFO_UNF_INTR_MASK bit in the SPI_INTR_MASK_0 register is turned off (thus, allowing the Interrupt). Software must remove the cause of Rx FIFO Overflow and clear the TX_FIFO_UNF bit by writing "1" to it before a new transaction can start. Note: In Master Mode, all the errors above can happen only when the CPU/GPC_DMA reads/writes an empty/full FIFO. The SPI controller will never write/read a full/empty FIFO. Instead the controller

- Serial Peripheral Interface (SPI)
will pause (stops sending clocks to the Slave with chip select being in an active state) whenever the FIFOs are full/empty. When the SPI controller is configured as a Slave, the following error scenarios can happen:
- Tx FIFO Overflow
- Tx FIFO Overflow happens when the CPU/GPC_DMA or the SPI controller writes into the Tx
FIFO when it is full. In this case, the SPI controller ends the transaction by setting the PIO/
- DMA_EN bit to "0," and flag the error bit along with TX_FIFO_OVF bit in the status
Register. The SPI controller generates an Interrupt if Interrupts are enabled. Software has to clear the error bit and TX_FIFO_OVF bit. To start a new transaction, software has to disable the Master from sending clocks and then flush the FIFOs by writing to the TX_FIFO_FLUSH/RX_FIFO_FLUSH bits in the SPI FIFO Control/Status Register.
- Rx FIFO Overflow
- Rx FIFO Overflow happens when the CPU/GPC_DMA or the SPI controller writes into Rx
FIFO when it is full in BOTH_EN Mode. In this case, the SPI controller ends the transaction by setting the PIO/DMA_EN bit to "0," and flag the error bit along with RX_FIFO_OVF bit in the status Register. The SPI controller generates an Interrupt if Interrupts are enabled.
- Software has to clear the error bit and RX_FIFO_OVF bit along with the Interrupt bit. To
start a new transaction, software has to disable the Master from sending clocks and flush the FIFOs by writing to the TX_FIFO_FLUSH/RX_FIFO_FLUSH bits in the SPI FIFO Control/ Status Register.
- Tx FIFO Underflow
- Tx FIFO Underflow happens when the CPU/GPC_DMA or the SPI controller reads from Tx
FIFO when it is empty. In this case, the SPI controller ends the transaction by setting the
- PIO/DMA_EN bit to "0," and flag the error bit along with the TX_FIFO_UNF bit in the SPI
- FIFO Control/Status Register. The SPI controller generates an Interrupt if Interrupts are
enabled. Software has to clear the error bit and TX_FIFO_UNF bit along with the Interrupt bit. To start a new transaction, software has to disable the Master from sending clocks and flush the FIFOs by writing to the TX_FIFO_FLUSH/RX_FIFO_FLUSH bits in the SPI FIFO Control/Status Register.
- Rx FIFO Underflow
- Rx FIFO Underflow happens when the CPU/GPC_DMA or the SPI controller reads from the
- Rx FIFO in BOTH_EN Mode. In this case, the SPI controller ends the transaction by setting
the PIO/DMA_EN bit to "0," and flag the error bit along with the RX_FIFO_UNF bit in the
- SPI FIFO Control/Status Register. The SPI controller generates an Interrupt if Interrupts
are enabled. Software has to clear the error bit and RX_FIFO_UNF bit along with the
- Interrupt bit. To start a new transaction, software has to disable the Master from sending
clocks and flush the FIFOs by writing to the TX_FIFO_FLUSH/RX_FIFO_FLUSH bits in the SPI FIFO Control/Status Register.
- CS_inactive

- Serial Peripheral Interface (SPI)
- When the SPI controller is configured as a Slave and CS_ACTIVE_BETWEEN_PACKETS_n in
the SPI_TIMING_REG2_0 Register is set, if an external Master deasserts the chip select in the middle of a transaction, the SPI controller ends the transaction by setting the PIO/ DMA_EN bit to "0," and sets the CS_INACTIVE bit in the SPI FIFO Control/Status Register.
- The SPI controller generates an Interrupt if Interrupts are enabled. Software has to clear
the CS_INACTIVE bit. To start a new transaction, software has to disable the Master from sending clocks and flush the FIFOs by writing to the TX_FIFO_FLUSH/RX_FIFO_FLUSH bits in the SPI FIFO Control/Status Register. It is software's responsibility to read the data that is left out of the Rx FIFO for CS inactive.
- For example, if the Interrupt trigger is set for four words and external Master has taken
the CS off in between the transfer, and at that point of time the Rx FIFO has only two words, it is software's responsibility to read out those two words or flush the FIFO.
- Frame_End
- When the SPI controller is configured as a Slave and DMA-continuous and
- CS_ACTIVE_BETWEEN_PACKETS_n in the SPI_TIMING_REG2_0 Register is set, if an
external Master stops sending clocks for more than Slave_idle_clock_count programmed in the Register, the SPI controller ends the transaction by setting the DMA bit to "0," and sets the FRAME_END bit in the SPI FIFO Control/Status Register. The SPI controller generates an Interrupt if Interrupts are enabled. Software has to clear the FRAME_END bit along with the Interrupt bit. To start a new transaction, software has to disable the Master from sending clocks and flush the FIFOs by writing to the TX_FIFO_FLUSH/
- RX_FIFO_FLUSH bits in the SPI FIFO Control/Status Register. If the Master resumes the clk
within "Slave_idle_clock_count", the SPI controller will also pause and resume the transaction whenever ext_clk is available.
#### 10.14.2.4 Programming Guidelines
There are two basic modes of operation: DMA and PIO modes. It is required that software sets up all parameters in the following registers before enabling the SPI_COMMAND_0.PIO bit for any of these modes.
- SPI_COMMAND_0
- SPI_COMMAND2_0
- SPI_TIMING_REG1_0
- SPI_TIMING_REG2_0
- SPI_TRANSFER_STATUS_0
- SPI_FIFO_STATUS_0
- SPI_DMA_CTL_0
- SPI_DMA_BLK_SIZE_0

- Serial Peripheral Interface (SPI)
##### 10.14.2.4.1 PIO Mode
This mode is enabled by writing "1" to the PIO bit in the SPI Command1 Register. In this mode, the SPI controller transmits/receives as many packets as configured by software in the SPI Block Size Register.
- PIO Mode has the same features as DMA Mode. The difference between PIO Mode and DMA Mode
is that in PIO Mode, the maximum number of packets that can be transmitted or received is less than or equal to 64.
##### 10.14.2.4.2 DMA Mode
This mode is enabled by writing "1" to the DMA bit in the SPI DMA Control Register. In this mode, the SPI controller transmits or receives the number of packets as indicated by the BLOCK_SIZE field in the SPI Block Size Register. If the PACKED bit is set and BIT_LEN is set to 7, then all FIFO words contain four packets to transfer (transmit or receive). Packets are transferred as per the En_LE_Bit and En_LE_Byte bit configurations (see the En_LE_Bit and En_LE_Byte Modes section), with packet 0 in byte 0 of the FIFO and packet 3 in byte 3 of the FIFO. In Unpacked Mode, if BIT_LEN is set to N, each packet will consist of (N + 1) bits. These bits will be transmitted/received in the Tx FIFO/Rx FIFO as per the En_LE_Bit and En_LE_Byte bit configurations (see the En_LE_Bit and En_LE_Byte Modes section). Any remaining bits in the FIFO will be ignored by the hardware. The maximum packet length is 32, which can be selected by setting BIT_LEN to "31". In this case, all data bits in the FIFO contain valid packet data. A DMA request will be generated to GPC_DMA in this mode depending on the setting of Tx_TRIG and Rx_TRIG. If transmits are enabled, setting Tx_TRIG to "00" generates a Tx DMA request whenever the Tx FIFO has one word of space available (if not full). Setting Tx_TRIG to "01" generates a Tx DMA request whenever the Tx FIFO has four words of space available. If receives are enabled, setting Rx_TRIG to "00" will generate an Rx DMA request whenever the Rx FIFO has one word of data available (is not empty). Setting Rx_TRIG to "01" generates an Rx DMA request whenever the Rx FIFO has four words of data available.
##### 10.14.2.4.3 Interrupt Generation
The SPI controller generates an Interrupt to the processor at the end of a transfer in PIO Mode or when an error is detected in PIO or DMA Mode. An Interrupt is generated whenever RDY or one of the FIFO status bits in the SPI FIFO Control/ Status Register is set by the hardware. During transmits, when the SPI controller is configured as a Slave, if software/GPC DMA cannot fill the transmit FIFO fast enough, hardware will set the TX_FIFO_UNF bit and an Underflow condition

- Serial Peripheral Interface (SPI)
is generated. If software tries to write to a full Tx FIFO, hardware sets the TX_FIFO_OVF bit as an indication that software attempted to Overflow the Tx FIFO. Hardware makes sure that the Overflowing data is never written to the Tx FIFO. During receives, when the SPI controller is configured as a Slave, if software/GPC DMA cannot read the receive FIFO fast enough, hardware will set the RX_FIFO_OVF bit and an Overflow condition is generated. However, if software tries to read from an empty Rx FIFO, hardware sets the RXF_UNF bit as an indication that software attempted to Underflow the Rx FIFO. The Interrupt can be cleared by writing a "1" to the source of the Interrupt. If the Interrupt is generated by assertion of RDY, then writing a "1" to the RDY bit clears the Interrupt. If the Interrupt is generated by assertion of TX_FIFO_OVF, then writing a "1" to the TXF_OVF bit clears the Interrupt. If the Interrupt is generated by assertion of RX_FIFO_UNF, then writing a "1" to RXF_UNF bit clears the Interrupt. Guideline for DMA use cases: In DMA Mode, if Interrupts are enabled, the SPI software driver has to deal with three Interrupts: one from the SPI controller and two from the Tx and Rx GPC DMA channels. This might make it complicated for the driver and also stresses the system. In such cases, software can use the Rx DMA Interrupt as the final one at which point all hardware activities can be assumed to be complete. But, in variable transfer lengths (continuous mode), software has to rely on the controller's Interrupts.
##### 10.14.2.4.4 Clock Initialization and Control
The SPI controller runs at 50 MHz at its interface to external SPI devices. The internal SPI controller clock (spi_clk) should run at the same frequency as the outgoing Interface Clock (SCK_Out) in Master Mode. In Slave Mode, however, the internal SPI interface clock frequency has to be 50% greater than the external clock (SCK_in). Note: The ratio between the Slave core clock and the Slave interface clock must be maintained at 1.5x. For example if the Slave interface clock is running at 10 MHz, the Slave core clock must not be less than 10x 1.5 MHz.
- Controller Enable
The SPI controller can be enabled in two ways:
- Write (CLK_RST_CONTROLLER_CLK_OUT_ENB_SPI<i>_0.CLK_ENB_SPI<i> = 1), where i = 1, 2,
3.
- Write (CLK_RST_CONTROLLER_CLK_OUT_ENB_SPI<i>_SET_0.SET_CLK_ENB_SPI<i> = 1),
where i = 1, 2, 3. Correspondingly, to disable the SPI controller:
- Write (CLK_RST_CONTROLLER_CLK_OUT_ENB_SPI<i>_0.CLK_ENB_SPI<i> = 0), where i = 1, 2,
3.

- Serial Peripheral Interface (SPI)
- Write (CLK_RST_CONTROLLER_CLK_OUT_ENB_SPI<i>_CLR_0.CLR_CLK_ENB_SPI<i> =

