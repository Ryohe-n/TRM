# 0 = NOINTR 1 = INTR 0x0 NOTIFY_FIFO_OVFL_ERR_STATUS: Set by Hardware when any of the NOTIFY input FIFO has overflowed.

- This basically means that Real Time CPU has not been able to keep
up its pace with the notify events arrival speed. 0 = NOINTR 1 = INTR 0x0 NOTIFY_TIMESTAMP_OVFL_ERR_STATUS: any event of notify infifo is read out after 8 ms this causes wrong timestamp read out check VI_NOTIFY_INFIFO_TIMESTAMP_OVRFLOW_ERR_STATUS_0 for more details 0 = NOINTR 1 = INTR
- VI_CFG_INTERRUPT_MASK_0
- Offset: 0x100e
- Byte Offset: 0x4038
- Read/Write: R/W
- Parity Protection: N

- Video Input Registers
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxx00,0000,0000,0000,xxxx,xx00,000x,00xx)
- Bit
- Reset
- Description
0x0 VGP6_INT_MASK:
- VGP6 pin Interrupt Mask
- This bit controls interrupt when VGP6
rising/falling edge is detected. 0= Disabled 1= Enabled 0 = DISABLED 1 = ENABLED 0x0 VGP5_INT_MASK:
- VGP5 pin Interrupt Mask
- This bit controls interrupt when VGP5
rising/falling edge is detected. 0= Disabled 1= Enabled 0 = DISABLED 1 = ENABLED 0x0 VGP4_INT_MASK:
- VGP4 pin Interrupt Mask
- This bit controls interrupt when VGP4
rising/falling edge is detected. 0= Disabled 1= Enabled 0 = DISABLED 1 = ENABLED 0x0 VGP3_INT_MASK:
- VGP3 pin Interrupt Mask
- This bit controls interrupt when VGP3
rising/falling edge is detected. 0= Disabled 1= Enabled 0 = DISABLED 1 = ENABLED 0x0 VGP2_INT_MASK:
- VGP2 pin Interrupt Mask
- This bit controls interrupt when VGP2
rising/falling edge is detected. 0= Disabled 1= Enabled 0 = DISABLED 1 = ENABLED 0x0 VGP1_INT_MASK:
- VGP1 pin Interrupt Mask
- This bit controls interrupt when VGP1
rising/falling edge is detected. 0= Disabled 1= Enabled 0 = DISABLED 1 = ENABLED

- Video Input Registers
- Bit
- Reset
- Description
0x0 CSBMASTER_CFGREG_REG_PARITY_ERR_MASK: 0 = Disabled 1 = Enabled 0 = DISABLED 1 = ENABLED 0x0 CSIMUX_REG_PARITY_ERR_MASK: 0 = Disabled 1 = Enabled 0 = DISABLED 1 = ENABLED 0x0 CHANSEL_SHADOW_REG_PARITY_ERR_MASK: 0 = Disabled 1 = Enabled 0 = DISABLED 1 = ENABLED 0x0 CHANSEL_DIRECT_REG_PARITY_ERR_MASK: 0 = Disabled 1 = Enabled 0 = DISABLED 1 = ENABLED 0x0 ATOMP_REG_PARITY_ERR_MASK: 0 = Disabled 1 = Enabled 0 = DISABLED 1 = ENABLED 0x0 PIXFMT_CFG_REG_PARITY_ERR_MASK: 0 = Disabled 1 = Enabled 0 = DISABLED 1 = ENABLED 0x0 PIXFMT_REG_PARITY_ERR_MASK: 0 = Disabled 1 = Enabled 0 = DISABLED 1 = ENABLED 0x0 CHANCMD_REG_PARITY_ERR_MASK: 0 = Disabled 1 = Enabled 0 = DISABLED 1 = ENABLED 0x0 ATOMP_TOSSED_ERR_MASK:
- ATOMP Tossed happened

