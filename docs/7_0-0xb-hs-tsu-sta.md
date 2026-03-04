# 7 :0 0xb HS_TSU_STA:

- Set-up time for a Repeated START condition
- I2C_I2C_MASTER_RESET_CNTRL_0
- I2C Master reset control register
- Offset: 0xa8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 SOFT_RESET:
- If SOFT_RESET is set to 1, it will reset all internal state of Master logic
including FIFOs. But registers configuration is retained. Clear this bit to 0 for normal operation.
- I2C transfers: Wait 2µs after reset assertion and also after clear, before going
for any data transfers. SMBUS transfers where Timeout feature used: Wait 5ms after reset assertion and clear. 0 = CLEARED 1 = ASSERTED
- I2C_I2C_SLV_RESET_CNTRL_0
- I2C Slave reset control register
- Offset: 0xac
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 SOFT_RESET:
- If SOFT_RESET is set to 1, it will reset all internal state of Slave logic including
- FIFOs. But registers configuration is retained. Clear this bit to 0 for normal
operation.
- I2C transfers: Wait 2µs after reset assertion and also after clear, before going
for any data transfers. SMBUS transfers where Timeout feature used: Wait 5ms after reset assertion and clear. 0 = CLEARED 1 = ASSERTED
- I2C_MST_PACKET_TRANSFER_CNT_STATUS_0
- Offset: 0xb0
- Read/Write: RO

- I2C Registers
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,0000,0000,0000,0000)
- Bit
- Reset
- Description

