# 20 :16 0x0 REQ_SEL: 0 = I2C8 1 = I2C10 2 = UARTG 3 = UARTC 5 = QSPI0 6 = QSPI1 8 = UARTA 9 = UARTB 12 = UARTF 13 = UARTH 15 = SPI1 16 = SPI2 17 = SPI3 19 = UARTD 20 = UARTE 21 = I2C 22 = I2C2 23 = I2C3 24 = I2C5 26 = I2C4 27 = I2C7 30 = I2C6 31 = I2C9 29 = RSVD 0x1 IRQ_MASK: 0 = DISABLE 1 = ENABLE 13:10 0x1

- WEIGHT
- GPCDMA_CHANNEL_CH31_STA_0
- Offset: 0x200004
- Read/Write: See table below
- Parity Protection: N
- SCR Protection: SCR_CH31_0
- Reset: 0x00000000 (0b00x0,0000,0x00,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
R/W
- Reset
- Description
- RO
0x0 BSY: 0 = WAIT 1 = ACTIVE
- RW
0x0 ISE_EOC: 0 = NO_INTR 1 = INTR
- RO
0x0 PING_PONG_STA: 0 = PING_INTR_STA 1 = PONG_INTR_STA
- RO
0x0 DMA_ACTIVITY: 0 = IDLE 1 = BUSY

- GPC-DMA Registers
- Bit
R/W
- Reset
- Description
- RO
0x0 CHANNEL_PAUSE: 0 = RESUME 1 = PAUSE
- RO
0x0 CHANNEL_RX: 0 = NOT_ACTIVE 1 = ACTIVE
- RO
0x0 CHANNEL_TX: 0 = NOT_ACTIVE 1 = ACTIVE
- RO
0x0 IRQ_INTR_STA: 0 = DISABLE 1 = ENABLE
- RO
0x0 TRIG_STA: 0 = NOT_ACTIVE 1 = ACTIVE
- RO
0x0 INTR_STA: 0 = NOT_ACTIVE 1 = ACTIVE
- GPCDMA_CHANNEL_CH31_CSRE_0
- Offset: 0x200008
- Read/Write: R/W
- Parity Protection: N
- SCR Protection: SCR_CH31_0
- Reset: 0x00000000 (0b0xxx,xxxx,xxxx,0000,00xx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description
0x0 DMA_ACTIVITY: 0 = RESUME 1 = PAUSE

- GPC-DMA Registers
- Bit
- Reset
- Description

