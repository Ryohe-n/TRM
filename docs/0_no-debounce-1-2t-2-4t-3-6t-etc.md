# 0 = No debounce 1 = 2T 2 = 4T 3 = 6T, etc.

- Where T is the period of the clk source coming to I2C. Maximum
debounce period programmable is 14T. A debounce period of >50ns is desirable
- RO
0x1 NEW_MASTER_FSM: Maintained for compatibility sake. 0 = DISABLE 1 = ENABLE
- RW
0x0 PACKET_MODE_EN: Write 1 to initiate transfer in packet mode. 0 = NOP 1 = GO

- I2C Registers
- Bit
R/W
- Reset
- Description
- RW
0x0 SEND:
- Writing a 1 causes the master to initiate the transaction in normal
mode. Values of other bits are not affected when this bit is 1, cleared by hardware. Other bits of the register are masked for writes when this bit is programmed to one. Hence, firmware should first configure all other registers and bits [8:0] of I2C_CNFG register before the bit I2C_CNFG[9] is programmed to Zero. 0 = NOP 1 = GO
- RW
0x0 NOACK: Enable mode to handle devices that do not generate ACK. 1 - don't look for an ack at the end of the Enable 0 = DISABLE 1 = ENABLE
- RW
0x0 CMD2: Read/Write Command for Slave 2: 1 - Read Transaction; 0 - write Transaction.
- For a 7-bit slave address, this bit must match with the LSB of
address byte for slave 2. Valid only when bit-4 of this register is set. 0 = DISABLE 1 = ENABLE
- RW
0x0 CMD1: Read/Write Command for Slave 1: 1 - Read Transaction; 0 - write Transaction.
- Command for Slave 1: For a 7-bit slave address this bit must match
with the LSB of address byte for slave1. 0 = DISABLE 1 = ENABLE
- RW
0x0 START: 1 = Yes, a Start byte needs to be sent. 0 = DISABLE 1 = ENABLE
- RW
0x0 SLV2: 1 = Enables a two slave transaction 0 = No command for Slave 2 present. 0 = DISABLE 1 = ENABLE 3:1
- RW
0x0 LENGTH:
- The Number of bytes to be transmitted per transaction 000 =
1byte ... 111 = 8bytes;
- In a two slave transaction number of bytes should be programmed
less than or equal to 011. I2C transfer with Slave-address byte only is not supported in the controller.
- RW
0x0 A_MOD:
- Address mode defines whether a 7-bit or a 10-bit slave address is
programmed. 1 = 10-bit device address; 0 = 7-bit device address 0 = SEVEN_BIT_DEVICE_ADDRESS 1 = TEN_BIT_DEVICE_ADDRESS
- I2C_I2C_CMD_ADDR0_0

- I2C Registers
I2C Slave-1 Address. I2C_CMD_ADDR0 is programmed the 7-bit or 10-bit address of slave 1 with which the transaction is intended;
- Offset: 0x4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000,0000)
- Bit
- Reset
- Description

