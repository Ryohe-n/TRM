# 31 :0 0x0 RD_DATA:

- Software Reads data from this register, causes pop
- I2C_I2C_SLV_PACKET_STATUS_0
- Offset: 0x80
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xx00,0000,0000,0000,0000,0000,0000)

- I2C Registers
- Bit
- Reset
- Description
0x0 ACK_WITHHELD:
- Indicates that ack is withheld for last byte and slave is waiting for host
to explicitly command slave to ACK the last byte 0 = Bus is released 1 = ACK is withheld 0x0 TRANSFER_COMPLETE:
- ALL the packets have been transferred successfully

