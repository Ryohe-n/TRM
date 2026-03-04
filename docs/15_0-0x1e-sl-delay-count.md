# 15 :0 0x1e SL_DELAY_COUNT:

- The value determines the timing between an address cycle and a
subsequent data cycle or two consecutive data cycles on the bus. The I2C_SL_DELAY_COUNT is valid only when internal slave is accessed.
- I2C_SL_DELAY_COUNT has to be programmed such that TIMING = T * DLY
where T is period of clock source selected for I2c; and DLY is
- I2C_SL_DELAY_COUNT; TIMING is the desired timing, A value of >= 1250 ns
is advisable.
- I2C_I2C_SL_INT_MASK_0
- IC Controller Slave Mask (Slave)
- Offset: 0x40
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x000000fd (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,1111,11x1)
- Bit
- Reset
- Description
0x1 HW_MSTR_INT: 0 = DISABLE 1 = ENABLE 0x1 REPROG_SL: 0 = DISABLE 1 = ENABLE 0x1 RST_SL: 0 = DISABLE 1 = ENABLE 0x1 END_TRANS: 0 = DISABLE 1 = ENABLE 0x1 SL_IRQ: 0 = DISABLE 1 = ENABLE 0x1 RCVD: 0 = DISABLE 1 = ENABLE 0x1 ZA: 0 = DISABLE 1 = ENABLE
- I2C_I2C_SL_INT_SOURCE_0
- IC Controller Slave Source (Slave)

- I2C Registers
- Offset: 0x44
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,00x0)
- Bit
- Reset
- Description
0x0 HW_MSTR_INT: 0 = UNSET 1 = SET 0x0 REPROG_SL: 0 = UNSET 1 = SET 0x0 RST_SL: 0 = UNSET 1 = SET 0x0 END_TRANS: 0 = UNSET 1 = SET 0x0 SL_IRQ: 0 = UNSET 1 = SET 0x0 RCVD: 0 = UNSET 1 = SET 0x0 ZA: 0 = UNSET 1 = SET
- I2C_I2C_SL_INT_SET_0
- IC Controller Slave Source (Slave)
- Offset: 0x48
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,00x0)
- Bit
- Reset
- Description
0x0 HW_MSTR_INT: 0 = UNSET 1 = SET

- I2C Registers
- Bit
- Reset
- Description
0x0 REPROG_SL: 0 = UNSET 1 = SET 0x0 RST_SL: 0 = UNSET 1 = SET 0x0 END_TRANS: 0 = UNSET 1 = SET 0x0 SL_IRQ: 0 = UNSET 1 = SET 0x0 RCVD: 0 = UNSET 1 = SET 0x0 ZA: 0 = UNSET 1 = SET
- I2C_I2C_TX_PACKET_FIFO_0
- Offset: 0x50
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

