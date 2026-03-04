# 15 :0 0x2 TCAPTURE_DAT:

- Used to tune the Slave Controller Data Capture Period. Shifts the
sampling point of SDA line by (Tcpature_dat+1) i2c_clk cycles from SCL rising edge. 0 = This field is not used, SDA line is sampled on SCL rising edge. Program to a value that is less than half (1/2) of SCL High time in number of i2c_clk cycles.

