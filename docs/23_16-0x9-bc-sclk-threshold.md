# 23 :16 0x9 BC_SCLK_THRESHOLD:

- Send the clock pulses until this threshold is met
0x1 BC_STOP_COND: 0 = NO_STOP: do not send stop condition at the end of bus clear operation 1 = STOP: send stop condition at the end of the bus clear operation 0x0 BC_TERMINATE: 0 = THRESHOLD: irrespective of SDA release status during BC, terminate the BC only after threshold is reached. 1 = IMMEDIATE: terminate the bus clear operation immediately when
- SDA is released or threshold count is reached whichever is earlier
0x0 BC_ENABLE:
- Starts bus clear operation, Hardware auto-clears this bit upon bus clear
transaction completion
- I2C_I2C_BUS_CLEAR_STATUS_0
- Offset: 0x88
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)

- I2C Registers
- Bit
- Reset
- Description
0x0 BC_STATUS: 0 = NOT_CLEARED: indicates SDA is not released by slave, its status is still low. 1 = CLEARED: SDA is released
- I2C_I2C_CONFIG_LOAD_0
- Offset: 0x8c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
0x0 TIMEOUT_CONFIG_LOAD:
- This bit loads the timeout configuration from pclk domain to the receive
(i2c_slow_clk) domain. Software has to set this bit at the end after doing the required registers configuration for the logic to take the updates. Once the internal update is done, Hardware auto clears this bit. Since the Hardware would be busy with internal update, Software should not write again until this bit is cleared by Hardware. 0 = DISABLE 1 = ENABLE 0x0 SLV_CONFIG_LOAD:
- This bit loads the slave configuration from pclk domain to the receive (i2c_clk)
domain. Software has to set this bit finally after doing the required registers configuration for the slave controller to take updates. Once the internal update is done, Hardware auto clears this bit. Since the Hardware would be busy with internal update, Software should not write again until this bit is cleared by Hardware. 0 = DISABLE 1 = ENABLE 0x0 MSTR_CONFIG_LOAD:
- This bit loads the master configuration from pclk domain to the receive (i2c_clk)
domain. Software has to set this bit finally after doing the required registers configuration like I2C_I2C_CNFG_0 bit fields etc. Once the internal update is done, Hardware auto clears this bit. Since the Hardware would be busy with internal update, Software should not write again until this bit is cleared by Hardware. 0 = DISABLE 1 = ENABLE
- I2C_I2C_CLKEN_OVERRIDE_0
- Offset: 0x90
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0,00x0)

- I2C Registers
- Bit
- Reset
- Description
- CLK_GATED
I2C_BUS_CLEAR_CLKEN_OVR:
- Override for 2nd-level clock enable for I2C bus clear logic

