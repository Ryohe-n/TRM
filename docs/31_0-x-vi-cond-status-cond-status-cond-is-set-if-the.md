# 31 :0 X VI_COND_STATUS: COND_STATUS[COND] is set if the FIFO for COND overflows. This bit is sticky and will remain set until cleared. Cleared by writing 1.

- VI_CFG_INTSTATUS_0
- Offset: 0x1008
- Byte Offset: 0x4020
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 CTXSW_INT:
- Context switch interrupt status (clear on write)
- VI_CFG_INTERRUPT_STATUS_0

- Video Input Registers
- Offset: 0x100d
- Byte Offset: 0x4034
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxx00,0000,0000,0000,xxxx,xx00,000x,00xx)
- Bit
- Reset
- Description
0x0 VGP6_INT_STATUS:
- VGP6 pin Interrupt Status
- This bit controls interrupt when VGP6
rising/falling edge is detected. 0= Interrupt not detected 1= Interrupt detected 0 = NOINTR 1 = INTR 0x0 VGP5_INT_STATUS:
- VGP5 pin Interrupt Status
- This bit controls interrupt when VGP5
rising/falling edge is detected. 0= Interrupt not detected 1= Interrupt detected 0 = NOINTR 1 = INTR 0x0 VGP4_INT_STATUS:
- VGP4 pin Interrupt Status
- This bit controls interrupt when VGP4
rising/falling edge is detected. 0= Interrupt not detected 1= Interrupt detected 0 = NOINTR 1 = INTR 0x0 VGP3_INT_STATUS:
- VGP3 pin Interrupt Status
- This bit controls interrupt when VGP3
rising/falling edge is detected. 0= Interrupt not detected 1= Interrupt detected 0 = NOINTR 1 = INTR 0x0 VGP2_INT_STATUS:
- VGP2 pin Interrupt Status
- This bit controls interrupt when VGP2
rising/falling edge is detected. 0= Interrupt not detected 1= Interrupt detected 0 = NOINTR 1 = INTR

- Video Input Registers
- Bit
- Reset
- Description
0x0 VGP1_INT_STATUS:
- VGP1 pin Interrupt Status
- This bit controls interrupt when VGP1
rising/falling edge is detected. 0= Interrupt not detected 1= Interrupt detected 0 = NOINTR 1 = INTR 0x0 CSBMASTER_CFGREG_REG_PARITY_ERR_STATUS: 0 = NOINTR 1 = INTR 0x0 CSIMUX_REG_PARITY_ERR_STATUS: 0 = NOINTR 1 = INTR 0x0 CHANSEL_SHADOW_REG_PARITY_ERR_STATUS: 0 = NOINTR 1 = INTR 0x0 CHANSEL_DIRECT_REG_PARITY_ERR_STATUS: 0 = NOINTR 1 = INTR 0x0 ATOMP_REG_PARITY_ERR_STATUS: 0 = NOINTR 1 = INTR 0x0 PIXFMT_CFG_REG_PARITY_ERR_STATUS: 0 = NOINTR 1 = INTR 0x0 PIXFMT_REG_PARITY_ERR_STATUS: 0 = NOINTR 1 = INTR 0x0 CHANCMD_REG_PARITY_ERR_STATUS: 0 = NOINTR 1 = INTR

- Video Input Registers
- Bit
- Reset
- Description
0x0 ATOMP_TOSSED_ERR_STATUS:
- ATOMP Tossed happened

