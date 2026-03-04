# 15 :8 0x0 SL_ADDR1: For a 10-bit slave address, this field is the least significant 8 bits. 7:0 0x0 SL_ADDR0: For a 10-bit slave address, this field is the least significant 8 bits.

- I2C_I2C_SL_ADDR2_0
- IC Controller Slave Address 2 Register (Slave)
- Offset: 0x30
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxx0,xxxx,x000,xxxx,x000)
- Bit
- Reset
- Description
0x0 SELECT_SLAVE: 0 = Use slave addr0 1 = Use slave addr1 10:9 0x0 SL1_ADDR_HI:
- In 7 bit address mode these bits are don't care;
In 10 bit address mode they represent the 2 MSB of the address. 0x0 SL1_VLD: 0 = 7-bit addressing. 0 = SEVEN_BIT_ADDR_MODE 1 = TEN_BIT_ADDR_MODE 2:1 0x0 SL_ADDR_HI:
- In 7-bit address mode these bits are don't care;
In 10-bit address mode they represent the 2 MSB of the address. 0x0 VLD: 0 = 7-bit addressing. 1 = 10-bit addressing. 0 = SEVEN_BIT_ADDR_MODE 1 = TEN_BIT_ADDR_MODE
- I2C_I2C_TLOW_SEXT_0

- I2C Registers
- IC Controller SMBUS timeout thresholds
- Offset: 0x34
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 RST_SL_ON_TIMEOUT:
- Reset Slave state machine on time-out
0x0 TLOW_MEXT_EN:
- Enable TLOW_MEXT counter
0x0 TLOW_SEXT_EN:
- Enable TLOW_SEXT counter
0x0 TIMEOUT_EN:
- Enable TIMEOUT counter

