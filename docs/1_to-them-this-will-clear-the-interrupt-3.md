# 1 to them. This will clear the interrupt. 3.

- When New Transaction (READ) started with RepeatedStart, The Slave does the following after
receiving the address byte of the new transaction: 1.
- Sets I2C_I2C_SL_STATUS_0[RNW] bit field with received address byte[0] bit which indicates
transfer direction. 0 = WRITE, 1 = READ Saves the received address byte in the I2C_I2C_SL_RCVD_0 register.
- Sets I2C_I2C_SL_STATUS_0[RCVD] and I2C_I2C_SL_STATUS_0[SL_IRQ] bits indicating that a
new transaction is received.
- Generates an interrupt to the system if interrupt enables bits
(I2C_I2C_SL_INT_MASK_0[RCVD], I2C_I2C_SL_INT_MASK_0[SL_IRQ]) are set. 2. 3. 4. Holds the I2C bus by doing clock stretching (holds I2C SCL line low) until the interrupt is cleared. 5.
- New Transaction Interrupt Handling
1. 2. Read I2C_I2C_SL_INT_SOURCE_0 register and check which bit fields are set to 1.
- In the new transaction received case, I2C_I2C_SL_INT_SOURCE_0[RCVD] and
I2C_I2C_SL_INT_SOURCE_0[SL_IRQ] bits are set to 1.
- Check I2C_I2C_SL_STATUS_0[RNW] bit status. For write transactions,
I2C_I2C_SL_STATUS_0[RNW] = WRITE is set.
- Clear I2C_I2C_SL_STATUS_0[RCVD] and I2C_I2C_SL_STATUS_0[SL_IRQ] bits by writing 1 to
them. This clears the interrupt and releases the SCL line, allowing the Master to go to next phase of the transaction 3. 4.
- Slave Response to Data Phase of the Write Transaction
When the Master sends a data byte, the Slave controller does the following: 1. 2. 3. Saves the received byte in the I2C_I2C_SL_RCVD_0 register. Sets I2C_I2C_SL_STATUS_0[SL_IRQ] bit indicating a byte received.
- Generates an interrupt to the system if interrupt enable bit
I2C_I2C_SL_INT_MASK_0[SL_IRQ] is set.

- I2C Registers
The Slave will hold the I2C bus by doing clock stretching (holds I2C SCL line low) until the interrupt is cleared. 4.
- Interrupts Handling When Received a Data Byte
1. 2. 3. 4. Read I2C_I2C_SL_INT_SOURCE_0 register and check which bit fields are set to 1. In the data_byte received case, I2C_I2C_SL_INT_SOURCE_0[SL_IRQ] bit is set to 1. Read the data byte from the I2C_I2C_SL_RCVD_0 register. To continue with the transfer, keep I2C_I2C_SL_CNFG_0[NACK] = DISABLE setting.
- Otherwise, to signal the Master to stop the transfer, configure I2C_I2C_SL_CNFG_0[NACK] =
ENABLE. Clear I2C_I2C_SL_STATUS_0[SL_IRQ] by writing 1 to it. This clears the interrupt and releases the SCL line, allowing the Master to go ahead with next phase of the transaction. 5.
- Slave Response to STOP Condition of the Write Transaction
If the Master sends STOP condition next, the Slave does the following: 1.
- Sets I2C_I2C_SL_STATUS_0[END_TRANS] and I2C_I2C_SL_STATUS_0[SL_IRQ] bits indicating
STOP condition is received.
- Generates an interrupt to the system if Interrupt bits
(I2C_I2C_SL_INT_MASK_0[END_TRANS], I2C_I2C_SL_INT_MASK_0[SL_IRQ]) are enabled. 2.
- Interrupts Handling When Stop Condition is Received
1. 2. Read the I2C_I2C_SL_INT_SOURCE_0 register and check which bit fields are set to 1.
- In the STOP condition case, I2C_I2C_SL_INT_SOURCE_0[END_TRANS] and
I2C_I2C_SL_INT_SOURCE_0[SL_IRQ] bits are set to 1.
- Clear I2C_I2C_SL_STATUS_0[END_TRANS] and I2C_I2C_SL_STATUS_0[SL_IRQ] bits by writing

