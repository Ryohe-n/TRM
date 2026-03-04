# 31 :16 0x19 I2C_CLK_DIVISOR_STD_FAST_MODE: N = divide by n+1 15:0 0x1 I2C_CLK_DIVISOR_HSMODE: N = divide by n+1

- I2C_I2C_INTERRUPT_SOURCE_REGISTER_0
This is a read-only register which returns the AND of Interrupt Status and Interrupt Mask registers.
- Offset: 0x70
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxx0,0000,0000,xx00,xxxx,0000,0000,0000)
- Bit
- Reset
- Description
0x0 SLV_ACK_WITHHELD: 0 = UNSET 1 = SET 0x0 SLV_RD2WR: 0 = UNSET 1 = SET 0x0 SLV_WR2RD: 0 = UNSET 1 = SET 0x0 SLV_PKT_XFER_ERR:
- Error occurred during slave xfer

