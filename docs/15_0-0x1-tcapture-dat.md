# 15 :0 0x1 TCAPTURE_DAT:

- Used to tune the Master Controller Data Capture Period. Shifts the
sampling point of SDA line by (Tcpature_dat+1) i2c_clk cycles from SCL rising edge. 0 = This field is not used, SDA line is sampled on SCL rising edge. Program to a value that is less than 3 or I2C_CLK_DIVISOR_STD_FAST_MODE or
- I2C_CLK_DIVISOR_HSMODE whichever is lower based on speed mode

- Universal Asynchronous Receiver/Transmitter (UART)
- I2C_I2C_SLV_DATA_CAPTURE_TIMING_0
Register for I2C Slave controller data capturing time.
- Offset: 0xe0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000002 (0bxxxx,xxxx,xxxx,xxxx,0000,0000,0000,0010)
- Bit
- Reset
- Description

