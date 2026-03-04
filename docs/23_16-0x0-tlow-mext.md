# 23 :16 0x0 TLOW_MEXT:

- Cumulative clock low extend time (master device) accumulated over a
byte transfer period in milli-seconds (START to ACK, ACK to ACK, or ACK to STOP). 15:8 0x0 TLOW_SEXT:
- Cumulative clock low extend time (slave device) accumulated over a
complete transfer (START until STOP) 7:0 0x0 TIMEOUT:
- Clock low timeout period in milli-seconds
- I2C_I2C_SL_DELAY_COUNT_0
- IC Slave Controller Delay Count
- Offset: 0x3c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0000001e (0bxxxx,xxxx,xxxx,xxxx,0000,0000,0001,1110)

- I2C Registers
- Bit
- Reset
- Description

