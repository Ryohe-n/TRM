# 7 :0 0x0 DATA5: This register contains the Fifth data byte to be sent/received.

- I2C_I2C_STATUS_0

- I2C Registers
- IC Controller Status (Master). I2C_STATUS gives the status of I2C Master operation
- Offset: 0x1c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxx0,0000,0000)
- Bit
- Reset
- Description
0x0 BUSY: 0 = NOT_BUSY 1 = BUSY 7:4 0x0 CMD2_STAT: Transaction for Slave2 for x byte failed. x is 'h0 to 'ha, all others invalid. 0 = SL2_XFER_SUCCESSFUL 1 = SL2_NOACK_FOR_BYTE1 2 = SL2_NOACK_FOR_BYTE2 3 = SL2_NOACK_FOR_BYTE3 4 = SL2_NOACK_FOR_BYTE4 5 = SL2_NOACK_FOR_BYTE5 6 = SL2_NOACK_FOR_BYTE6 7 = SL2_NOACK_FOR_BYTE7 8 = SL2_NOACK_FOR_BYTE8 9 = SL2_NOACK_FOR_BYTE9 10 = SL2_NOACK_FOR_BYTE10 3:0 0x0 CMD1_STAT: Transaction for Slave1 for x byte failed. x is 'h0 to 'ha, all others invalid. 0 = SL1_XFER_SUCCESSFUL 1 = SL1_NOACK_FOR_BYTE1 2 = SL1_NOACK_FOR_BYTE2 3 = SL1_NOACK_FOR_BYTE3 4 = SL1_NOACK_FOR_BYTE4 5 = SL1_NOACK_FOR_BYTE5 6 = SL1_NOACK_FOR_BYTE6 7 = SL1_NOACK_FOR_BYTE7 8 = SL1_NOACK_FOR_BYTE8 9 = SL1_NOACK_FOR_BYTE9 10 = SL1_NOACK_FOR_BYTE10
- I2C_I2C_SL_CNFG_0
IC Controller Configuration (Slave). The register should be programmed when I2C controller is configured as slave.
- Offset: 0x20
- Read/Write: See table below
- Parity Protection: N
- Shadow: N

- I2C Registers
- SCR Protection: 0
- Reset: 0x00000004 (0bxxxx,xxxx,xx00,0000,0000,0000,0000,0100)
- Bit
R/W
- Reset
- Description
- RW
0x0 SLV_XFER_ERR_CLK_STRETCH_EN: This bit is used in FIFO mode only.
- If a transfer resulted in SLV_PKT_XFER_ERR, enabling this bit makes
the Slave to stretch the I2C SCL line after Address cycle and ACK bit of following transfer. This helps Software in cases where it is not ready to attend SLV_PKT_XFER_ERR immediately and wants to stall the Master until that time. Once SLV_PKT_XFER_ERR status is cleared by Software, SCL line will be released by the Slave. 0 = DISABLE 1 = ENABLE
- RW
0x0 FIFO_XFER_EN:
- If this bit is disabled, data is always communicated via I2C_SL_RCVD
register. If enabled, it is through FIFOs 0 = DISABLE 1 = ENABLE 19:8
- RW
0x0 BUFFER_SIZE:
- Payload size in bytes. RSVD
- RW
0x0 ACK_LAST_BYTE_VALID: ack the last byte valid(Write-Only) This bit qualifies ACK_LAST_BYTE field 0 = DISABLE 1 = ENABLE
- RW
0x0 ACK_LAST_BYTE: ack the last byte 0 = DISABLE 1 = ENABLE
- RW
0x0 ACK_WITHHOLD_EN:
- Ack Withhold Feature Enable

