# 1 to them. This will clear the interrupt. 3. Notes: 1.

- If the Master terminates the transaction while the Slave controller is ready to accept the
data, I2C_INTERRUPT_STATUS_REGISTER_0[SLV_PKT_XFER_ERR] bit is set at the end of the transaction when STOP condition is received. This bit can be cleared by writing 1 to it or it can be ignored. If the Slave controller sends NACK to any of the bytes during the write transfer, Master will terminate the transaction after seeing NACK bit. In this case, No status bits (END_TRANS,
- SL_IRQ or SLV_PKT_XFER_ERR) would be set when STOP condition is received. No interrupts
either. 2.
##### 10.11.3.5.2 Programming Model for Slave-Transmit in 7-bit Addressing Mode
(Transfer Direction not Changed), Interrupt Method
- Initial Configuration
Before accessing the I2C controller, set up the following:
- I2C clocks programming
- Pinmux programming
- I2C controller reset release

- I2C Programming Guidelines
- I2C Controller Registers Initialization
- Write I2C_I2C_SLV_RESET_CNTRL[SOFT_RESET] = CLEARED
- Write I2C_SLV_FIFO_CONTROL = 0x0
- Write I2C_I2C_INTERRUPT_SET_REGISTER = 0x0
- Write I2C_I2C_CLKEN_OVERRIDE = 0x0
- Write I2C_I2C_DEBUG_CONTROL = 0x0
- Write I2C_I2C_TLOW_SEXT_0 = 0x0
- Write I2C_I2C_SL_INT_SET_0 = 0x0
- Write I2C_I2C_SL_DELAY_COUNT_0 = 0x1e
- Select Slave Address Register and Configure it in 7-bit Addressing Mode
- Write I2C_I2C_SL_ADDR1_0[SL_ADDR1] = 0
- Write 7-bit slave address in I2C_I2C_SL_ADDR1_0[SL_ADDR0] = {1'b0, SlaveAddress[6:0]}
- To use SL_ADDR0 bit field for Slave address, write I2C_I2C_SL_ADDR2_0[SELECT_SLAVE] = 0
- Write I2C_I2C_SL_ADDR2_0[SL1_ADDR_HI] = 0
- Write I2C_I2C_SL_ADDR2_0[SL1_VLD] = SEVEN_BIT_ADDR_MODE
- Write I2C_I2C_SL_ADDR2_0[SL_ADDR_HI] = 0
- Write I2C_I2C_SL_ADDR2_0[VLD] = SEVEN_BIT_ADDR_MODE
- Configure Interrupt Mask Registers to Enable the Interrupts
- Write I2C_INTERRUPT_MASK_REGISTER_0 = 0x0
- Write I2C_I2C_SL_INT_MASK_0[HW_MSTR_INT] = DISABLE
- Write I2C_I2C_SL_INT_MASK_0[REPROG_SL] = DISABLE
- Write I2C_I2C_SL_INT_MASK_0[RST_SL] = DISABLE
- Write I2C_I2C_SL_INT_MASK_0[END_TRANS] = ENABLE
- Write I2C_I2C_SL_INT_MASK_0[SL_IRQ] = ENABLE
- Write I2C_I2C_SL_INT_MASK_0[RCVD] = ENABLE
- Write I2C_I2C_SL_INT_MASK_0[ZA] = DISABLE
- Configure SL_CNFG Register to Enable the Slave Controller
- Write I2C_I2C_SL_CNFG_0[ENABLE_SL] = 1
- Write I2C_I2C_SL_CNFG_0[PKT_MODE_EN] = 0
- Write I2C_I2C_SL_CNFG_0[NEWSL] = 1
- Write I2C_I2C_SL_CNFG_0[FIFO_XFER_EN] = 0
- Write I2C_I2C_SL_CNFG_0[SLV_XFER_ERR_CLK_STRETCH_EN] = 0
- Write I2C_I2C_SL_CNFG_0[BUFFER_SIZE] = 0
- Write I2C_I2C_SL_CNFG_0[ACK_LAST_BYTE_VALID] = 0

- I2C Programming Guidelines
- Write I2C_I2C_SL_CNFG_0[RESP] = 0
- Write I2C_I2C_SL_CNFG_0[ACK_WITHHOLD_EN] = 0
- Write I2C_I2C_SL_CNFG_0[ACK_LAST_BYTE] = 0
- Write I2C_I2C_SL_CNFG_0[NACK] = DISABLE
- Activate the Configuration with I2C_CONFIG_LOAD Register Programming
- I2C_I2C_CONFIG_LOAD_0[TIMEOUT_CONFIG_LOAD] = ENABLE
- I2C_I2C_CONFIG_LOAD_0[SLV_CONFIG_LOAD] = ENABLE
- I2C_I2C_CONFIG_LOAD_0[MSTR_CONFIG_LOAD] = DISABLE
- Wait for the Hardware to Clear the I2C_CONFIG_LOAD Register Bit Fields
1. 2.
- Wait until I2C_I2C_CONFIG_LOAD_0[TIMEOUT_CONFIG_LOAD] becomes zero
- Wait until I2C_I2C_CONFIG_LOAD_0[SLV_CONFIG_LOAD] becomes zero
With this, the Slave controller is ready for the data transfers. Start a Read transaction from the I2C Master device.
- Slave Response to Address Phase of Read Transaction
When the Slave receives an address byte from the bus and if the address matches its programmed address, it does the following: 1.
- Sets I2C_I2C_SL_STATUS_0[RNW] bit field with received address byte[0] bit which indicates
transfer direction. 0 = WRITE, 1=READ Saves the received address byte in I2C_I2C_SL_RCVD_0 register.
- Sets I2C_I2C_SL_STATUS_0[RCVD] and I2C_I2C_SL_STATUS_0[SL_IRQ] bits indicating that a
new transaction is received.
- Generates an interrupt to the system if Interrupt enables bits
(I2C_I2C_SL_INT_MASK_0[RCVD], I2C_I2C_SL_INT_MASK_0[SL_IRQ]) are set. 2. 3. 4. Holds the I2C bus by doing clock stretching (holds I2C SCL line low) until the interrupt is cleared and a data byte is available in the I2C_I2C_SL_RCVD_0 register. 5.
- New Transaction Interrupt Handling
1. 2. Read I2C_I2C_SL_INT_SOURCE_0 register and check which bit fields are set to 1.
- In the new transaction received case, I2C_I2C_SL_INT_SOURCE_0[RCVD] and
I2C_I2C_SL_INT_SOURCE_0[SL_IRQ] bits are set to 1.
- Check I2C_I2C_SL_STATUS_0[RNW] bit status. For read transactions,
I2C_I2C_SL_STATUS_0[RNW] = READ is set.
- Clear I2C_I2C_SL_STATUS_0[RCVD] and I2C_I2C_SL_STATUS_0[SL_IRQ] bits by writing 1 to
them. This will clear the interrupt. Write Data byte to the I2C_I2C_SL_RCVD_0 register. This will release the SCL line. Master can read this byte now. 3. 4. 5.

- I2C Programming Guidelines
- Slave Response to Data Phase of Read Transaction
If Master ACKs previous byte transfer, it means the Master wants to continue the read operation further. The Slave controller does the following in this case: 1. 2. Sets I2C_I2C_SL_STATUS_0[SL_IRQ] bit indicating a request to transmit a data byte.
- Generates an interrupt to the system if interrupt enable bit
I2C_I2C_SL_INT_MASK_0[SL_IRQ] is set. Slave will hold the I2C bus by doing clock stretching (holds I2C SCL line low) until a data byte is available in I2C_I2C_SL_RCVD_0 register to transmit to the bus. 3.
- Interrupts Handling in Data Byte Transmit Case
1. 2. 3. 4. Read I2C_I2C_SL_INT_SOURCE_0 register and check which bit fields are set to 1. In the data transmit case, only I2C_I2C_SL_INT_SOURCE_0[SL_IRQ] bit is set to 1. Clear I2C_I2C_SL_STATUS_0[SL_IRQ] bit by writing 1 to it. This will clear the interrupt. Write a Data byte to the I2C_I2C_SL_RCVD_0 register. This will release the SCL line and allow the Master to continue the transfer.
- Slave Response to End of the Read Transaction
If Master NACKs previous byte transfer, it means the Master wants to end the transaction. The Slave controller does the following then: 1.
- Sets I2C_I2C_SL_STATUS_0[END_TRANS] and I2C_I2C_SL_STATUS_0[SL_IRQ] bits indicating
the end of current transaction.
- Generates an interrupt to the system if interrupt bits
(I2C_I2C_SL_INT_MASK_0[END_TRANS], I2C_I2C_SL_INT_MASK_0[SL_IRQ]) are enabled. 2.
- Interrupts Handling When Transaction END is Received During Read
1. 2. Read the I2C_I2C_SL_INT_SOURCE_0 register and check which bit fields are set to 1.
- In the transaction END case, I2C_I2C_SL_INT_SOURCE_0[END_TRANS] and
- I2C_I2C_SL_INT_SOURCE_0[SL_IRQ] bits are set to 1
- Clear I2C_I2C_SL_STATUS_0[END_TRANS] and I2C_I2C_SL_STATUS_0[SL_IRQ] bits by writing

